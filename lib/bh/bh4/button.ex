defmodule Bh.Bh4.Button do
  @moduledoc """
  Twitter Bootstrap 4 button helpers for Phoenix.
  """

  use Phoenix.HTML

  @default :primary

  @contexts [@default, :secondary, :success, :info, :warning, :danger, :link]

  @allowed_opts [:context, :id, :size, :layout, :class, :data]

  @doc """
  Generates complex button HTML markup.

  ## Options

    * `:context` - context of the button. Allowed values are `:primary`,
    `:secondary`, `:success`, `:info`, `:warning`, `:danger`, `:link`. Default
    context is `:primary`.

    * `:id` - id of the button.

    * `:size` - size of the button. Supported sizes: `:large`, `:small`.
    By default the `:size` is not set (standard button size).

    * `:layout` - layout of the button. Allowed `:layout` value is `:block`. By
    default `:layout` value is not set (renders standard button layout).

    * `:class` - extra class, appended to the button classes. Option `:class`
    can take string of space-separated class names.

    * `:data` - data attributes list.

  ## Examples

      <%= bh_button "Button" %>
      <button class="btn btn-primary" type="button">Button</button>

      <%= bh_button "Button", size: :large, layout: :block, id: "my_id" %>
      <button class="btn btn-primary btn-lg btn-block" id="my_id" type="button">Button</button>

      <%= bh_button "Button", context: :danger, class: "something special" %>
      <button class="btn btn-danger something special" type="button">Button</button>


  With data-attributes:

      <%= bh_button "Button", data: [val: "value", other_val: "other_value"] %>
      <button class="btn btn-primary" data-other-val="other_value" data-val="value" type="button">Button</button>

  Note, that all `data-` keys in the resulting HTML are dasharized.
  """
  def bh_button(text, opts \\ []) do
    bh_context_extended_button(text, opts)
  end

  @doc """
  Generates complex outline button HTML markup. Accepts the same options as
  `bh_button/2`

  ## Examples

      <%= bh_button_outline "Button" %>
      <button class="btn btn-primary-outline" type="button">Button</button>

      <%= bh_button_outline "Button", context: :success %>
      <button class="btn btn-success-outline" type="button">Button</button>
  """
  def bh_button_outline(text, opts \\ []) do
    bh_context_extended_button(text, opts, :outline)
  end

  defp bh_context_extended_button(text, opts, type \\ "") do
    opts =
      opts
      |> Enum.filter(fn {x, _} -> x in @allowed_opts end)

    final_opts =
      []
      |> put_button_type
      |> put_button_context(opts, type)
      |> put_button_id(opts)
      |> put_button_size(opts)
      |> put_button_layout(opts)
      |> put_button_extra_class(opts)
      |> put_button_data(opts)

    content_tag(:button, final_opts) do
      text
    end
  end

  defp put_button_type(final_opts) do
    Keyword.put final_opts, :type, :button
  end

  defp put_button_context(final_opts, opts, type) do
    type_class = case type do
      :outline -> "-outline"
      _        -> ""
    end

    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      Keyword.put(final_opts, :class, "btn btn-#{opts[:context]}#{type_class}")
    else
      Keyword.put(final_opts, :class, "btn btn-#{@default}#{type_class}")
    end
  end

  defp put_button_id(final_opts, opts) do
    if Keyword.has_key? opts, :id do
      Keyword.put(final_opts, :id, "#{opts[:id]}")
    else
      final_opts
    end
  end

  defp put_button_size(final_opts, opts) do
    allowed_sizes = [:large, :small]

    if Keyword.has_key?(opts, :size) && opts[:size] in allowed_sizes do
      size_class = case opts[:size] do
        :large -> "btn-lg"
        :small -> "btn-sm"
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

  defp put_button_extra_class(final_opts, opts) do
    if Keyword.has_key? opts, :class do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} #{opts[:class]}")
    else
      final_opts
    end
  end

  defp put_button_data(final_opts, opts) do
    if Keyword.has_key?(opts, :data) && is_list(opts[:data]) do
      Keyword.put(final_opts, :data, opts[:data])
    else
      final_opts
    end
  end
end
