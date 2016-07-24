defmodule Bh.Bh3.Progress do
  @moduledoc """
  Twitter Bootstrap 3 progress bar helpers for Phoenix.
  """

  @allowed_opts [:percentage]

  use Phoenix.HTML

  @doc """
  Generates progress bar HTML markup.

  ## Options

    * `:percentage` - used as a value of a progress bar. Default value - 0
    (zero progress).

  ## Examples

  Render markup for progress:

      <%= bh_progress percentage: 60 %>
      <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
          <span class="sr-only">60% Complete</span>
        </div>
      </div>
  """
  def bh_progress(opts \\ []) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    final_opts =
      []
      |> put_percentage(opts)

    render_bh_progress(final_opts)
  end

  defp render_bh_progress(final_opts) do
    inner_opts = [
      class:           "progress-bar",
      role:            "progressbar",
      "aria-valuenow": final_opts[:percentage],
      "aria-valuemin": 0,
      "aria-valuemax": 100,
      "style":         "width: #{final_opts[:percentage]}%;"
    ]

    content_tag :div, class: "progress" do
      content_tag :div, inner_opts do
        content_tag :span, class: "sr-only" do
          "#{final_opts[:percentage]}% Complete"
        end
      end
    end
  end

  defp put_percentage(final_opts, opts) do
    if Keyword.has_key?(opts, :percentage) do
      Keyword.put(final_opts, :percentage, opts[:percentage])
    else
      Keyword.put(final_opts, :percentage, 0)
    end
  end
end

