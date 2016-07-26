defmodule Bh.Bh3.ButtonTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh3.Button

  test "renders default button" do

    expected = ~s(<button class="btn btn-default" type="button">Button</button>)

    rendered =
      bh_button("Button")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end
end
