defmodule Bh.Bh4.ButtonTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh4.Button

  @contexts [:primary, :secondary, :success, :info, :warning, :danger, :link]

  test "default button context is rendered as primary" do
    expected = ~s(<button class="btn btn-primary" type="button">Button</button>)

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

  test "raises expection if invalid button context provided" do
    assert_raise ArgumentError, "Unsupported button context", fn ->
      bh_button "Button", context: :unsupported
    end
  end

  test "default outline button context is rendered as primary" do
    expected =
      ~s(<button class="btn btn-primary-outline" type="button">Button</button>)

    rendered =
      bh_button_outline("Button")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all valid outline button contexts are rendered properly" do
    for context <- @contexts do
      classes  = "btn btn-#{context}-outline"
      expected = ~s(<button class="#{classes}" type="button">Button</button>)

      rendered =
        bh_button_outline("Button", context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "raises expection if invalid outline button context provided" do
    assert_raise ArgumentError, "Unsupported button context", fn ->
      bh_button_outline "Button", context: :unsupported
    end
  end
end
