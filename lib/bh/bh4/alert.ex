defmodule Bh.Bh4.Alert do
  @moduledoc """
  Twitter Bootstrap 4 alert helpers for Phoenix.
  """
  use Phoenix.HTML

  @default :info

  @contexts [@default, :success, :warning, :danger]

  @allowed_opts [:context, :class, :id]

  @doc """
  Generates alert HTML markup.

  ## Options

    * `:context` - context of the alert. Allowed values are `:info`,
    `:success`, `:warning`, `:danger`. Default context is `:info`.

    * `:id` - id of the alert.

    * `:class` - extra class, appended to the alert classes. Option `:class`
    can take string of space-separated class names or symbol.

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
      <div class="alert alert-success extra" id="one" role="alert"><span><b>Alert</b> is <u>very important</u></span></div>
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
      |> Bh.Service.put_id_if_present(opts)
      |> put_alert_context(opts)
      |> put_alert_extra_class(opts)

    content_tag(:div, text, final_opts)
  end

  defp put_alert_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      Keyword.put(final_opts, :class, "alert alert-#{opts[:context]}")
    else
      Keyword.put(final_opts, :class, "alert alert-#{@default}")
    end
  end

  defp put_alert_extra_class(final_opts, opts) do
    if Keyword.has_key? opts, :class do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} #{opts[:class]}")
    else
      final_opts
    end
  end
end
