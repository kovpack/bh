defmodule Bh.Bh4.Progress do
  @moduledoc """
  Twitter Bootstrap 4 progress bar helpers for Phoenix.

  ## Examples

  Real live examples can be found on the site of the
  [Project](https://kovpack.github.io/bh/).
  """

  use Phoenix.HTML

  @allowed_opts [:percentage, :context, :striped, :animated]

  @contexts [:success, :info, :warning, :danger]

  @doc """
  Generates progress bar HTML markup.

  ## Options

    * `:percentage` - used as a value of a progress bar. Default value - 0
    (zero progress).

    * `:context` - context of the progress bar. Be default context is not
    needed, so helper renders blue proggress bar. Allowed options: `:success`,
    `:info`, `:warning` and `:danger`.

    * `:striped` - boolean value. Pass `true` if you need striped progress
    bar. By default progress bar is not striped.

    * `:animated` - boolean value. Pass `true` if you need animated progress
    bar. Be default progress bar has no CSS3 amination.

  ## Examples

  Render default HTML5 `progress`:

      <%= bh_progress percentage: 50 %>
      <progress class="progress" max="100" value="50">50%</progress>
  """
  def bh_progress(opts \\ []) do
    opts = Bh.Service.leave_allowed_opts(opts, @allowed_opts)

    final_opts =
      []
      |> Keyword.put(:class, "progress")
      |> Keyword.put(:max, 100)
      |> put_percentage(opts)
      |> put_progress_context(opts)
      |> put_striped(opts)
      |> put_animated(opts)

    render_bh_progress(final_opts)
  end

  defp render_bh_progress(final_opts) do
    content_tag(:progress, "#{final_opts[:value]}%", final_opts)
  end

  defp put_striped(final_opts, opts) do
    if Keyword.has_key?(opts, :striped) && opts[:striped] == true do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} progress-striped")
    else
      final_opts
    end
  end

  defp put_animated(final_opts, opts) do
    if Keyword.has_key?(opts, :animated) && opts[:animated] == true do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} progress-animated")
    else
      final_opts
    end
  end

  defp put_progress_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      with extra_class = "progress-#{opts[:context]}" do
        Keyword.put(final_opts, :class, "#{final_opts[:class]} #{extra_class}")
      end
    else
      final_opts
    end
  end

  defp put_percentage(final_opts, opts) do
    if Keyword.has_key?(opts, :percentage) do
      Keyword.put(final_opts, :value, opts[:percentage])
    else
      Keyword.put(final_opts, :value, 0)
    end
  end
end
