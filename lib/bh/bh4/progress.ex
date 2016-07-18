defmodule Bh.Bh4.Progress do
  @moduledoc """
  Twitter Bootstrap 4 progress bar helpers for Phoenix.

  ## Examples

  Real live examples can be found on the site of the
  [Project](https://kovpack.github.io/bh/).
  """

  @allowed_opts [:percentage]

  use Phoenix.HTML

  @doc """
  Generates progress bar HTML markup.

  ## Options

    * `:percentage` - used as a value of a progress bar. Default value - 0
    (zero progress).

  ## Examples

  Render default HTML5 `progress`:

      <%= bh_progress percentage: 50 %>
      <progress class="progress" max="100" value="50">%</progress>
  """
  def bh_progress(opts \\ []) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    final_opts =
      []
      |> Keyword.put(:class, "progress")
      |> Keyword.put(:max, 100)
      |> put_percentage(opts)

    render_bh_progress(final_opts)
  end

  defp render_bh_progress(final_opts) do
    content_tag(:progress, "#{final_opts[:value]}%", final_opts)
  end

  defp put_percentage(final_opts, opts) do
    if Keyword.has_key?(opts, :percentage) do
      Keyword.put(final_opts, :value, opts[:percentage])
    else
      Keyword.put(final_opts, :value, 0)
    end
  end
end
