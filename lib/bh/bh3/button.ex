defmodule Bh.Bh3.Button do
  @moduledoc """
  Twitter Bootstrap 3 button helpers for Phoenix.
  """

  use Phoenix.HTML

  @default :default

  @contexts [@default]

  @allowed_opts []

  @doc """
  Generates complex button HTML markup.

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
