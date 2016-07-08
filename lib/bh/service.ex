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

  def put_id_if_present(final_opts, opts) do
    if Keyword.has_key? opts, :id do
      Keyword.put(final_opts, :id, "#{opts[:id]}")
    else
      final_opts
    end
  end
end
