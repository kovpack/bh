defmodule Bh.Bh3.Button do
  @moduledoc """
  Twitter Bootstrap 3 button helpers for Phoenix.
  """

  use Phoenix.HTML

  @default :default

  @contexts [@default, :primary, :success, :info, :warning, :danger, :link]

  @allowed_opts [:context, :id]

  @doc """
  Generates complex button HTML markup.

  ## Options

    * `:context` - context of the button. Allowed values are `:default`,
    `:primary`, `:success`, `:info`, `:warning`, `:danger`, `:link`. Default
    context is `:default`.

    * `:id` - id of the button.

  ## Examples

      <%= bh_button "Button" %>
      <button class="btn btn-default" type="button">Button</button>
  """
  def bh_button(text, opts \\ [])
  def bh_button(text, opts) when is_list(opts) do
    bh_button_builder(text, opts)
  end

  defp bh_button_builder(text, opts) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    final_opts =
      []
      |> Keyword.put(:type, :button)
      |> put_button_context(opts)
      |> Bh.Service.put_id_if_present(opts)

    content_tag(:button, text, final_opts)
  end

  defp put_button_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      Keyword.put(final_opts, :class, "btn btn-#{opts[:context]}")
    else
      Keyword.put(final_opts, :class, "btn btn-#{@default}")
    end
  end
end
