defmodule Bh.Bh3.Label do
  @moduledoc """
  Twitter Bootstrap 3 label helpers for Phoenix.
  """

  defdelegate bh_label(text), to: Bh.Bh4.Label
  defdelegate bh_label(text, opts), to: Bh.Bh4.Label
end
