defmodule Bh.Bh4.Modal do
  @moduledoc """
  Twitter Bootstrap 4 modal helpers for Phoenix.
  """

  use Phoenix.HTML

  import Bh.Bh4.Button, only: [bh_button: 2]

  @default_id "myModal"

  @allowed_opts [:id]

  @doc """
  Generates HTML markup for dialogs.

  ## Options

    * `:id` - id of the dialog. Default id is "myDialog". In case of rendering
    multiple dialogs on the same page, be sure to pass different ids for each
    of them (or only the first one will be displayed when used). Keep in mind,
    that valid page should not have two same ids.

  ## Examples

  This snippet will generate dialog HTML markup with content block with provided
  text and footer block with "Close" button. This dialog will have default id -
  "#{@default_id}".

      <%= bh_dialog "Dialog content" %>
  """
  def bh_modal(content) when is_binary(content) do
    bh_modal_builder([content: content])
  end
  def bh_modal(content, opts) when is_binary(content) and is_list(opts) do
    opts = Keyword.put(opts, :content, content)
    bh_modal_builder(opts)
  end

  defp bh_modal_builder(opts) when is_list(opts) do
    final_opts = [
      class:             "modal fade in",
      role:              "dialog",
      "aria-hidden":     "true",
      tabindex:          "-1",
      "aria-labelledby": "myModalLabel"
    ]

    final_opts =
      final_opts
      |> put_proper_id_and_aria_labelled_by(opts)

    content_tag(:div, final_opts) do
      content_tag(:div, class: "modal-dialog", role: "document") do
        content_tag(:div, class: "modal-content") do
          [
            # build_modal_header(final_opts),
            build_modal_body(opts[:content]),
            build_modal_footer
          ]
        end
      end
    end
  end

  defp put_proper_id_and_aria_labelled_by(final_opts, opts) do
    if Keyword.has_key? opts, :id do
      final_opts =
        final_opts
        |> Keyword.put(:id, opts[:id])
        |> Keyword.put(:"aria-labelledby", "#{opts[:id]}Label")
    else
      final_opts =
        final_opts
        |> Keyword.put(:id, @default_id)
        |> Keyword.put(:"aria-labelledby", "#{@default_id}Label")
    end
  end

  defp build_modal_header(final_opts) do
    content_tag(:div, class: "modal-header") do
      [
        build_close_icon,
        content_tag(:h4, "Modal title", id: "#{final_opts[:id]}Label", class: "modal-title")
      ]
    end
  end

  defp build_modal_body(content) do
    content_tag(:div, class: "modal-body") do
      content_tag(:p, content)
    end
  end

  defp build_modal_footer do
    content_tag(:div, class: "modal-footer") do
      bh_button("Close", context: :secondary, data: [dismiss: "modal"])
    end
  end

  defp build_close_icon do
    opts = [
      type:         :button,
      class:        "close",
      "aria-label": "Close",
      data:         [dismiss: "modal"]
    ]

    content_tag(:button, opts) do
      content_tag(:span, "aria-hidden": "true") do
        {:safe, ["&times;"]}
      end
    end
  end
end
