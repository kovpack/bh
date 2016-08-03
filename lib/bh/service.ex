defmodule Bh.Service do
  @moduledoc false

  def trim_safe_text(text) do
    case text do
      {:safe, ["" | content]} -> {:safe, ["" | String.trim(content)]}
      _                       -> text
    end
  end

  def leave_allowed_opts(opts, allowed_opts) do
    Enum.filter opts, fn {x, _} -> x in allowed_opts end
  end

  def append_extra_css_class(final_opts, opts) do
    if Keyword.has_key? opts, :class do
      Keyword.put final_opts, :class, "#{final_opts[:class]} #{opts[:class]}"
    else
      final_opts
    end
  end

  def put_when_in_list(final_opts, symbol, opts) do
    cond do
      Keyword.has_key? opts, symbol ->
        Keyword.put final_opts, symbol, opts[symbol]
      true ->
        final_opts
    end
  end
end
