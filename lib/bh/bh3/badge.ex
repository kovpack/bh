defmodule Bh.Bh3.Badge do
  @moduledoc """
  Twitter Bootstrap 3 badge helpers for Phoenix.
  """

  use Phoenix.HTML

  @doc """
  Generates badge HTML markup.

  ## Examples

      <%= bh_badge "Badge" %>
      <span class="badge">Badge</span>
  """
  def bh_badge(text \\ "") do
    content_tag :span, text, class: "badge"
  end
end
