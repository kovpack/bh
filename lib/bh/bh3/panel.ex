defmodule Bh.Bh3.Panel do
  @moduledoc """
  Twitter Bootstrap 3 panel helpers for Phoenix.
  """

  use Phoenix.HTML

  @default_context :default

  @contexts [@default_context, :primary, :success, :info, :warning, :danger]

  @allowed_opts [:heading, :title, :footer, :context]

  @doc """
  Generates panel HTML markup

  ## Options

    * `:heading` - heading of the panel. By default heading is not rendered.

    * `:title` - heading of the panel, which gets rendered inside <h3> tag with
    overriden styles.

    * `:footer` - footer of the panel. By default is not rendered.

    * `:context` - context of the panel. Default one is `:default`. Supported
    contexts are `:default`, `:primary`, `:success`, `:info`, `:warning`,
    `:danger`.

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

  Panel with footer:

      <%= bh_panel "Panel content", footer: "Panel footer" %>
      <div class="panel panel-default">
        <div class="panel-body">
          Panel content
        </div>
        <div class="panel-footer">Panel footer</div>
      </div>
  """
  def bh_panel(text, opts) when is_binary(text) and is_list(opts) do
    final_opts =
      opts
      |> Bh.Service.leave_allowed_opts(@allowed_opts)
      |> prepare_options

    render_bh_panel(text, final_opts)
  end
  def bh_panel(text) when is_binary(text) do
    opts = [context_class: "panel-#{@default_context}"]

    render_bh_panel(text, opts)
  end

  defp render_bh_panel(text, opts) do
    content_tag :div, class: "panel #{opts[:context_class]}" do
      [
        render_header(opts),
        render_content(text),
        render_footer(opts)
      ]
    end
  end

  defp render_header(opts) do
    cond do
      Keyword.has_key?(opts, :title) ->
        content_tag(:div, class: "panel-heading") do
          content_tag(:h3, opts[:title], class: "panel-title")
        end
      Keyword.has_key?(opts, :heading) ->
        content_tag(:div, opts[:heading], class: "panel-heading")
      true ->
        ""
    end
  end

  defp render_content(text) do
    content_tag :div, text, class: "panel-body"
  end

  defp render_footer(opts) do
    if Keyword.has_key?(opts, :footer) do
      content_tag :div, opts[:footer], class: "panel-footer"
    else
      ""
    end
  end

  defp put_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      Keyword.put(final_opts, :context_class, "panel-#{opts[:context]}")
    else
      Keyword.put(final_opts, :context_class, "panel-default")
    end
  end

  defp prepare_options(opts) do
    []
    |> Bh.Service.put_when_in_list(:heading, opts)
    |> Bh.Service.put_when_in_list(:title, opts)
    |> Bh.Service.put_when_in_list(:footer, opts)
    |> put_context(opts)
  end
end
