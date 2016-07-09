defmodule Bh.Bh4.Modal do
  @moduledoc """
  Twitter Bootstrap 4 modal helpers for Phoenix.
  """

  use Phoenix.HTML

  def bh_modal do
    opts = [
      id:                "myModal",
      class:             "modal fade in",
      role:              "dialog",
      "aria-hidden":     "true",
      tabindex:          "-1",
      "aria-labelledby": "myModalLabel"
    ]
    content_tag(:div, opts) do
      content_tag(:div, class: "modal-dialog", role: "document") do
        content_tag(:div, class: "modal-content") do
          [build_modal_header, build_modal_body, build_modal_footer]
        end
      end
    end
  end

  defp build_modal_header do
    content_tag(:div, class: "modal-header") do
      [
        build_close_button,
        content_tag(:h4, "Modal title", id: "myModalLabel", class: "modal-title")
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
      [
        Bh.Bh4.Button.bh_button("Close", context: :secondary, data: [dismiss: "modal"]),
        Bh.Bh4.Button.bh_button("Save changes", data: [dismiss: "modal"])
      ]
    end
  end

  defp build_close_button do
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
