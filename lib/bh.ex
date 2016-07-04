defmodule Bh do
  @moduledoc """
  Twitter Bootstrap 4 helpers for Phoenix.
  """

  defdelegate bh_label(text), to: Bh.Label
  defdelegate bh_label(text, opts), to: Bh.Label

  defdelegate bh_label_pill(text), to: Bh.Label
  defdelegate bh_label_pill(text, opts), to: Bh.Label
end
