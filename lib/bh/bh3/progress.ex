defmodule Bh.Bh3.Progress do
  @moduledoc """
  Twitter Bootstrap 3 progress bar helpers for Phoenix.
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
    needed, so helper renderes blue proggress bar. Allowed options: `:success`,
    `:info`, `:warning` and `:danger`.

    * `:striped` - boolean value. Pass `true` if you need striped progress
    bar. By default progress bar is not striped.

    * `:animated` - boolean value. Pass `true` if you need animated progress
    bar. Be default progress bar has no CSS3 amination. Note, that only striped
    progress bars can be animated.

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
      |> Keyword.put(:class, "progress-bar")
      |> put_percentage(opts)
      |> put_progress_context(opts)
      |> put_striped(opts)
      |> put_animated(opts)

    render_bh_progress(final_opts)
  end

  defp render_bh_progress(final_opts) do
    inner_opts = [
      class:           final_opts[:class],
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

  defp put_progress_context(final_opts, opts) do
    if Keyword.has_key?(opts, :context) && opts[:context] in @contexts do
      with extra_class = "progress-bar-#{opts[:context]}" do
        Keyword.put(final_opts, :class, "#{final_opts[:class]} #{extra_class}")
      end
    else
      final_opts
    end
  end

  defp put_striped(final_opts, opts) do
    if Keyword.has_key?(opts, :striped) && opts[:striped] == true do
      final_classes = "#{final_opts[:class]} progress-bar-striped"
      Keyword.put(final_opts, :class, final_classes)
    else
      final_opts
    end
  end

  defp put_animated(final_opts, opts) do
    if Keyword.has_key?(opts, :animated) && opts[:animated] == true do
      Keyword.put(final_opts, :class, "#{final_opts[:class]} active")
    else
      final_opts
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

