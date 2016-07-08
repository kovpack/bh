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
end
