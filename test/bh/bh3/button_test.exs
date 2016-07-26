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

  test "renders id of the button if provided" do
    expected =
      ~s(<button class="btn btn-default" id="myButton" type="button">) <>
        ~s(Button)                                                     <>
      ~s(</button>)

    rendered =
      bh_button("Button", id: "myButton")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all button sizes are rendered properly" do
    sizes = [
      large: "lg",       lg: "lg",
      small: "sm",       sm: "sm",
      extra_small: "xs", xs: "xs"
    ]

    for {key, val} <- sizes do
      expected =
        ~s(<button class="btn btn-default btn-#{val}" type="button">) <>
          ~s(Button)                                                  <>
        ~s(</button>)

      rendered =
        bh_button("Button", size: key)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "button block layout rendered properly" do
    expected =
      ~s(<button class="btn btn-default btn-block" type="button">) <>
        ~s(Button)                                                 <>
      ~s(</button>)

    rendered =
      bh_button("Button", layout: :block)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders default button when only block with complex text provided" do
    expected =
      ~s(<button class="btn btn-default" type="button">)    <>
        ~s(<span><b>Bold</b> and <i>italic</i> text</span>) <>
      ~s(</button>)

    rendered =
      bh_button do
        {:safe, ["<span><b>Bold</b> and <i>italic</i> text</span>"]}
      end
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "button with complex block of safe text is rendered properly" do
    for context <- @contexts do
      expected =
        ~s(<button class="btn btn-#{context}" type="button">)  <>
          ~s(<span><b>Bold</b> and <i>italic</i> text</span>) <>
        ~s(</button>)

      rendered =
        bh_button(context: context) do
          {:safe, ["<span><b>Bold</b> and <i>italic</i> text</span>"]}
        end
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end
end
