defmodule Bh.ButtonTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Button

  @types [:primary, :secondary, :success, :info, :warning, :danger, :link]

  test "default button type is rendered as primary" do
    expected = ~s(<button class="btn btn-primary" type="button">Button</button>)
    rendered = Phoenix.HTML.safe_to_string(bh_button("Button"))

    assert rendered == expected
  end

  test "all valid button types are rendered properly" do
    for type <- @types do
      expected =
        ~s(<button class="btn btn-#{type}" type="button">Button</button>)
      rendered = Phoenix.HTML.safe_to_string(bh_button("Button", type: type))

      assert rendered == expected
    end
  end

  test "raises expection if invalid button type provided" do
    assert_raise ArgumentError, "Unsupported button type", fn ->
      bh_button "Button", type: :unsupported
    end
  end

  test "default outline button type is rendered as primary" do
    expected =
      ~s(<button class="btn btn-primary-outline" type="button">Button</button>)
    rendered = Phoenix.HTML.safe_to_string(bh_button_outline("Button"))

    assert rendered == expected
  end

  test "all valid outline button types are rendered properly" do
    for type <- @types do
      classes  = "btn btn-#{type}-outline"
      expected = ~s(<button class="#{classes}" type="button">Button</button>)

      rendered =
        Phoenix.HTML.safe_to_string(bh_button_outline("Button", type: type))

      assert rendered == expected
    end
  end

  test "raises expection if invalid outline button type provided" do
    assert_raise ArgumentError, "Unsupported button type", fn ->
      bh_button_outline "Button", type: :unsupported
    end
  end
end
