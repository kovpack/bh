defmodule Bh.Bh3.Button do
  @moduledoc """
  Twitter Bootstrap 3 button helpers for Phoenix.
  """

  use Phoenix.HTML

  @default :default

  @contexts [@default, :primary, :success, :info, :warning, :danger, :link]

  @allowed_opts [:context, :id, :size, :layout, :active, :disabled]

  @doc """
  Generates complex button HTML markup.

  ## Options

    * `:context` - context of the button. Allowed values are `:default`,
    `:primary`, `:success`, `:info`, `:warning`, `:danger`, `:link`. Default
    context is `:default`.

    * `:id` - id of the button.

    * `:size` - size of the button. Supported sizes: `:large` (alias `:lg`),
    `:small` (alias `:sm`) and `:extra_small` (alias `:xs`).  By default the
    `:size` is not set (standard button size).

    * `:layout` - layout of the button. Allowed `:layout` value is `:block`. By
    default `:layout` value is not set (renders standard button layout).

    * `:active` - boolean. If `true` - button is rendered with `active` class,
    which gives appearance of the pressed button. Default is `false`.

    * `:disabled` - boolean. If `true` - button looks unclickable (faded).
    Default is `false`.

  ## Examples

      <%= bh_button "Button" %>
      <button class="btn btn-default" type="button">Button</button>

  You can pass only block of complex HTML without any options if needed.

      <%= bh_button do %>
        <span>Some content and <b>bold words</b></span>
      <%= end %>
      <button class="btn btn-default" type="button">
        <span>Some content and <b>bold words</b></span>
      </button>
  """
  def bh_button(text) when is_binary(text) do
    bh_button(text, [])
  end
  def bh_button([do: block]) do
    block
    |> Bh.Service.trim_safe_text
    |> bh_button_builder
  end
  def bh_button(opts, [do: block]) when is_list(opts) do
    block
    |> Bh.Service.trim_safe_text
    |> bh_button_builder(opts)
  end
  def bh_button(text, opts) when is_list(opts) do
    bh_button_builder(text, opts)
  end

  defp bh_button_builder(text, opts \\ []) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    final_opts =
      []
      |> Keyword.put(:type, :button)
      |> put_button_context(opts)
      |> Bh.Service.put_when_in_list(:id, opts)
      |> put_button_size(opts)
      |> put_button_layout(opts)
      |> put_button_active(opts)
      |> put_button_disabled(opts)

    content_tag(:button, text, final_opts)
  end

  defp put_button_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      Keyword.put(final_opts, :class, "btn btn-#{opts[:context]}")
    else
      Keyword.put(final_opts, :class, "btn btn-#{@default}")
    end
  end

  defp put_button_size(final_opts, opts) do
    allowed_sizes = [:large, :lg, :small, :sm, :extra_small, :xs]

    if Keyword.has_key?(opts, :size) && opts[:size] in allowed_sizes do
      size_class = case opts[:size] do
        :large       -> "btn-lg"
        :lg          -> "btn-lg"
        :small       -> "btn-sm"
        :sm          -> "btn-sm"
        :extra_small -> "btn-xs"
        :xs          -> "btn-xs"
      end

      Keyword.put(final_opts, :class, "#{final_opts[:class]} #{size_class}")
    else
      final_opts
    end
  end

  defp put_button_layout(final_opts, opts) do
    if Keyword.has_key?(opts, :layout) && opts[:layout] == :block do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} btn-block")
    else
      final_opts
    end
  end

  defp put_button_active(final_opts, opts) do
    if Keyword.has_key?(opts, :active) && opts[:active] == true do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} active")
    else
      final_opts
    end
  end

  defp put_button_disabled(final_opts, opts) do
    if Keyword.has_key?(opts, :disabled) && opts[:disabled] == true do
      Keyword.put(final_opts, :disabled, "disabled")
    else
      final_opts
    end
  end
end
