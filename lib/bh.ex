defmodule Bh do
  @moduledoc """
  Twitter Bootstrap 4 helpers for Phoenix.
  """

  def bh_label(text), do: Bh.Label.bh_label(text)
  def bh_label(text, opts), do: Bh.Label.bh_label(text, opts)

  def bh_label_pill(text), do: Bh.Label.bh_label_pill(text)
  def bh_label_pill(text, opts), do: Bh.Label.bh_label_pill(text, opts)
end
