defmodule Bh.Bh3.IconTest do
  use ExUnit.Case, async: true

  import Bh.Bh3.Icon

  test "generates valid glypnicon markup when name provided" do
    expected =
      ~s(<span aria-hidden="true" class="glyphicon glyphicon-star"></span>)

    rendered =
      bh_icon(:star)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end
end
