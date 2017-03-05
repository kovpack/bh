defmodule Bh.Bh3.BadgeTest do
  use ExUnit.Case, async: true

  import Bh.Bh3.Badge

  test "generates valid badge markup when text provided" do
    expected = ~s(<span class="badge">Badge</span>)

    rendered =
      bh_badge("Badge")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "generates empty badge markup when text not provided" do
    expected = ~s(<span class="badge"></span>)

    rendered =
      bh_badge()
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end
end
