defmodule Bh.Bh3.Panel do
  @moduledoc """
  Twitter Bootstrap 3 panel helpers for Phoenix.
  """

  @allowed_opts [:heading, :title]

  use Phoenix.HTML

  @doc """
  Generates panel HTML markup

  ## Options

    * `:heading` - heading of the panel. By default heading is not rendered.

    * `:title` - heading of the panel, which gets rendered inside <h3> tag with
    overriden styles.

  ## Examples

  Simple panel:

      <%= bh_panel "Panel text" %>
      <div class="panel panel-default">
        <div class="panel-body">Panel text</div>
      </div>

  Panel with title:

      <%= bh_panel "Panel text", heading: "Panel heading" %>
      <div class="panel panel-default">
        <div class="panel-heading">Panel heading</div>
        <div class="panel-body">
          Panel text
        </div>
      </div>
  """
  def bh_panel(text, opts) when is_binary(text) and is_list(opts) do
    render_bh_panel(text, opts)
  end
  def bh_panel(text) when is_binary(text) do
    render_bh_panel(text)
  end
  def bh_panel(opts) when is_list(opts) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    render_bh_panel(opts)
  end

  defp render_bh_panel(text, opts \\ []) do
    cond do
      Keyword.has_key?(opts, :title) ->
        content_tag :div, class: "panel panel-default" do
          [
            content_tag(:div, class: "panel-heading") do
              content_tag(:h3, opts[:title], class: "panel-title")
            end,
            content_tag(:div, text, class: "panel-body")
          ]
        end
      Keyword.has_key?(opts, :heading) ->
        content_tag :div, class: "panel panel-default" do
          [
            content_tag(:div, opts[:heading], class: "panel-heading"),
            content_tag(:div, text, class: "panel-body")
          ]
        end
      true ->
        content_tag :div, class: "panel panel-default" do
          content_tag :div, text, class: "panel-body"
        end
    end
  end
end
