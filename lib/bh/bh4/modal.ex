defmodule Bh.Bh4.Modal do
  @moduledoc """
  Twitter Bootstrap 4 modal helpers for Phoenix.

  ## Examples

  Real live examples can be found on the site of the
  [Project](https://kovpack.github.io/bh/).
  """

  use Phoenix.HTML

  import Bh.Bh4.Button, only: [bh_button: 2]

  @default_id "myModal"

  @doc """
  Generates basic HTML markup for modals.

  ## Examples

  This snippet will generate modal HTML markup with content block with provided
  text and footer block with "Close" button. This modal will have default id -
  "#{@default_id}".

      <%= bh_modal "Modal content" %>
  """
  def bh_modal(content) when is_binary(content) do
    content = content_tag(:p, content)
    bh_modal_builder([content: content])
  end

  @doc """
  Generates complex HTML markup for modals.

  ## Options

    * `:id` - id of the modal. Default id is "myDialog". In case of rendering
    multiple modals on the same page, be sure to pass different ids for each
    of them (or only the first one will be displayed when used). Keep in mind,
    that valid page should not have two same ids.

    * `:size` - size of the modal dialog. Supported sizes: `:small`, `:large`.
    When size is not provided, dialog is rendered in standard size.

    * `:title` - title of the modal dialog. When provided, modal will render
    title block with close icon. When `:title` option provided, footer block
    with close button will not be rendered by default.

  ## Examples

  In order to give modal a specific id (in case you have multiple modals on
  one page), you have to pass an `:id` option.

      <%= bh_modal "Modal content", id: "myCustomId" %>

  If you want to make modal smaller or larger - you can pass `:size` option.

      <%= bh_modal "Modal content", id: "myCustomId", size: :large %>

  This will render the title block with the close icon, provided title and given
  content. Footer with the "Close" button as a redundant element will not be
  rendered by default when `:title` is provided.

      <%= bh_modal "Modal content", title: "Modal title" %>

  If you need complex HTML markup to be used to display coplex text inside
  modal window, you can give `bh_modal` function a block that will be taken
  for content. Please, note that in such case you should not pass the first
  string argument, but only the list of options.

      <%= bh_modal title: "Modal title", size: :small do %>
        <p>Some content. <b>Bold</b> and <i>italic</i> text.</p>
      <% end %>
  """
  def bh_modal(content, opts) when is_binary(content) and is_list(opts) do
    content = content_tag(:p, content)
    opts = Keyword.put(opts, :content, content)
    bh_modal_builder(opts)
  end
  def bh_modal(opts, [do: content]) when is_list(opts) do
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
      content_tag(:div, class: "modal-dialog#{size_class(opts)}", role: "document") do
        content_tag(:div, class: "modal-content") do
          [
            build_modal_header(final_opts, opts),
            build_modal_body(opts[:content]),
            build_modal_footer(final_opts, opts)
          ]
        end
      end
    end
  end

  defp size_class(opts) do
    if Keyword.has_key? opts, :size do
      case opts[:size] do
        :large -> " modal-lg"
        :small -> " modal-sm"
      end
    else
      ""
    end
  end

  defp put_proper_id_and_aria_labelled_by(final_opts, opts) do
    if Keyword.has_key? opts, :id do
      final_opts
      |> Keyword.put(:id, opts[:id])
      |> Keyword.put(:"aria-labelledby", "#{opts[:id]}Label")
    else
      final_opts
      |> Keyword.put(:id, @default_id)
      |> Keyword.put(:"aria-labelledby", "#{@default_id}Label")
    end
  end

  defp build_modal_header(final_opts, opts) do
    if Keyword.has_key? opts, :title do
      content_tag(:div, class: "modal-header") do
        [
          build_close_icon(),
          content_tag(:h4, opts[:title], id: "#{final_opts[:id]}Label", class: "modal-title")
        ]
      end
    else
      ""
    end
  end

  defp build_modal_body(content) do
    content_tag(:div, class: "modal-body") do
      content
    end
  end

  defp build_modal_footer(_final_opts, opts) do
    if !(Keyword.has_key? opts, :title) do
      content_tag(:div, class: "modal-footer") do
        bh_button("Close", context: :secondary, data: [dismiss: "modal"])
      end
    else
      ""
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
