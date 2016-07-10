defmodule Bh.Bh4.Modal do
  @moduledoc """
  Twitter Bootstrap 4 modal helpers for Phoenix.
  """

  use Phoenix.HTML

  import Bh.Bh4.Button, only: [bh_button: 2]

  @default_id "myModal"

  @allowed_opts [:id]

  def bh_modal, do: bh_modal([])
  def bh_modal(opts) when is_list(opts) do
    final_opts = [
      class:             "modal fade in",
      role:              "dialog",
      "aria-hidden":     "true",
      tabindex:          "-1",
      "aria-labelledby": "myModalLabel"
    ]

    final_opts =
      if Keyword.has_key? opts, :id do
        Keyword.put(final_opts, :id, opts[:id])
      else
        Keyword.put(final_opts, :id, @default_id)
      end

    content_tag(:div, final_opts) do
      content_tag(:div, class: "modal-dialog", role: "document") do
        content_tag(:div, class: "modal-content") do
          [
            build_modal_header(final_opts),
            build_modal_body,
            build_modal_footer
          ]
        end
      end
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

  defp build_modal_body do
    content_tag(:div, class: "modal-body") do
      content_tag(:p, "One fine body here")
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
