defmodule Bh.Bh3.ButtonTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh3.Button

  @contexts [:default, :primary, :success, :info, :warning, :danger, :link]

  test "renders default button" do
    expected = ~s(<button class="btn btn-default" type="button">Button</button>)

    rendered =
      bh_button("Button")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all valid button contexts are rendered properly" do
    for context <- @contexts do
      expected =
        ~s(<button class="btn btn-#{context}" type="button">Button</button>)

      rendered =
        bh_button("Button", context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end
end
