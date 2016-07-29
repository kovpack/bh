defmodule Bh.Bh3.Panel do
  @moduledoc """
  Twitter Bootstrap 3 panel helpers for Phoenix.
  """

  @allowed_opts []

  use Phoenix.HTML

  def bh_panel(text) when is_binary(text) do
    render_bh_panel(text)
  end
  def bh_panel(opts \\ []) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    render_bh_panel(opts)
  end

  defp render_bh_panel(text, opts \\ []) do
    content_tag :div, class: "panel panel-default" do
      content_tag :div, text, class: "panel-body"
    end
  end
end
