defmodule Bh.Bh4.Alert do
  @moduledoc """
  Twitter Bootstrap 4 alert helpers for Phoenix.

  ## Examples

  Real live examples can be found on the site of the
  [Project](https://kovpack.github.io/bh/).
  """

  use Phoenix.HTML

  @default :info

  @contexts [@default, :success, :warning, :danger]

  @allowed_opts [:context, :class, :id, :dismissible]

  @doc """
  Generates alert HTML markup.

  ## Options

    * `:context` - context of the alert. Allowed values are `:info`,
    `:success`, `:warning`, `:danger`. Default context is `:info`.

    * `:id` - id of the alert.

    * `:class` - extra class, appended to the alert classes. Option `:class`
    can take string of space-separated class names or symbol.

    * `:dismissible` - boolean field. Will result in alert block with close
    button. Requires `alert.js` plugin.

  ## Examples

      <%= bh_alert "Alert text" %>
      <div class="alert alert-info" role="alert">Alert text</div>

  Multiple options:

      <%= bh_alert "Alert text", id: :one, class: "extra", context: :danger %>
      <div class="alert alert-danger extra" id="one" role="alert">Alert text</div>

  Instead of a simple alert text message you can pass a complex markup as a
  block:

      <%= bh_alert context: :success, id: :one, class: :extra do %>
        <span><b>Alert</b> is <u>very important</u></span>
      <% end %>
      <div class="alert alert-success extra" id="one" role="alert">
        <span><b>Alert</b> is <u>very important</u></span>
      </div>

  Dismissible alert example:

      <%= bh_alert context: :success, id: :one, class: :extra, dismissible: true do %>
        <span><b>Dismissible alert</b> is <u>very important</u></span>
      <% end %>

  Dismissible alert HTML result:

      <div class="alert alert-success extra alert-dismissible fade in" id="one" role="alert">
        <button aria-label="Close" class="close" data-dismiss="alert" type="button">
          <span aria-hidden="true">×</span>
        </button>
        <span><b>Dismissible alert</b> is <u>very important</u></span>
      </div>
  """
  def bh_alert(text, opts \\ [])
  def bh_alert(opts, [do: block]) when is_list(opts) do
    block
    |> Bh.Service.trim_safe_text
    |> bh_context_extended_alert(opts)
  end
  def bh_alert(text, opts) when is_list(opts) do
    bh_context_extended_alert(text, opts)
  end

  defp bh_context_extended_alert(text, opts) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    final_opts =
      []
      |> Keyword.put(:role, "alert")
      |> Bh.Service.put_when_in_list(:id, opts)
      |> put_alert_context(opts)
      |> Bh.Service.append_extra_css_class(opts)

    if Keyword.has_key?(opts, :dismissible) && opts[:dismissible] do
      final_opts =
        final_opts
        |> Keyword.delete(:dismissible)
        |> Bh.Service.append_extra_css_class(class: "alert-dismissible fade in")

      build_dismissible_alert(text, final_opts)
    else
      content_tag(:div, text, final_opts)
    end
  end

  defp put_alert_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      Keyword.put(final_opts, :class, "alert alert-#{opts[:context]}")
    else
      Keyword.put(final_opts, :class, "alert alert-#{@default}")
    end
  end

  defp build_dismissible_alert(text, final_opts) do
    content_tag(:div, final_opts) do
      [build_close_button(), text]
    end
  end

  defp build_close_button do
    opts = [
      type:         :button,
      class:        "close",
      "aria-label": "Close",
      data:         [dismiss: "alert"]
    ]

    content_tag(:button, opts) do
      content_tag(:span, "aria-hidden": "true") do
        {:safe, ["&times;"]}
      end
    end
  end
end
