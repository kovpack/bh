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

  test "all button sizes are rendered properly" do
    sizes = [small: "sm", large: "lg"]

    for {key, val} <- sizes do
      expected =
        """
        <button class="btn btn-primary btn-#{val}" type="button">\
        Button\
        </button>\
        """

      rendered =
        bh_button("Button", size: key)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "button block layout rendered properly" do
    expected =
      """
      <button class="btn btn-primary btn-block" type="button">\
      Button\
      </button>\
      """

    rendered =
      bh_button("Button", layout: :block)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "button extra classes rendered properly" do
    expected =
      """
      <button class="btn btn-primary something special" type="button">\
      Button\
      </button>\
      """

    rendered =
      bh_button("Button", class: "something special")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "button data attributes rendered properly" do
    expected =
      ~s(<button )                        <>
        ~s(class="btn btn-primary" )      <>
        ~s(data-other-val="other value" ) <>
        ~s(data-val="value" )             <>
      ~s(type="button">)                  <>
        ~s(Button)                        <>
      ~s(</button>)

    rendered =
      bh_button("Button", data: [val: "value", other_val: "other value"])
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "button is rendered properly with multiple options" do
    expected =
      ~s(<button )                                                <>
        ~s(class="btn btn-primary btn-lg btn-block other class" ) <>
        ~s(data-other-val="other value" data-val="value" )        <>
        ~s(id="my_id" )                                           <>
      ~s(type="button">)                                          <>
        ~s(Button)                                                <>
      ~s(</button>)

    rendered =
      bh_button("Button", id:     "my_id",
                          size:   :large,
                          layout: :block,
                          class:  "other class",
                          data:   [val: "value", other_val: "other value"])
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

  test "button with complex block with safe text is rendered properly" do
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

  test "default outline button context is rendered as primary" do
    expected =
      ~s(<button class="btn btn-primary-outline" type="button">Button</button>)

    rendered =
      bh_button_outline("Button")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all outline button sizes are rendered properly" do
    sizes = [small: "sm", large: "lg"]

    for {key, val} <- sizes do
      expected =
        """
        <button class="btn btn-primary-outline btn-#{val}" type="button">\
        Button\
        </button>\
        """

      rendered =
        bh_button_outline("Button", size: key)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "outline button block layout rendered properly" do
    expected =
      """
      <button class="btn btn-primary-outline btn-block" type="button">\
      Button\
      </button>\
      """

    rendered =
      bh_button_outline("Button", layout: :block)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "outline button extra classes rendered properly" do
    expected =
      """
      <button class="btn btn-primary-outline something special" type="button">\
      Button\
      </button>\
      """

    rendered =
      bh_button_outline("Button", class: "something special")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "outline button data attributes rendered properly" do
    expected =
      ~s(<button )                                         <>
        ~s(class="btn btn-primary-outline" )               <>
        ~s(data-other-val="other value" data-val="value" ) <>
      ~s(type="button">)                                   <>
        ~s(Button)                                         <>
      ~s(</button>)

    rendered =
      bh_button_outline("Button",
        data: [val: "value", other_val: "other value"]
      )
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "outline button is rendered properly with multiple options" do
    expected =
      ~s(<button )                                                        <>
        ~s(class="btn btn-primary-outline btn-lg btn-block other class" ) <>
        ~s(data-other-val="other value" data-val="value" )                <>
        ~s(id="my_id" )                                                   <>
      ~s(type="button">)                                                  <>
        ~s(Button)                                                        <>
      ~s(</button>)

    rendered =
      bh_button_outline("Button",
        id:     "my_id",
        size:   :large,
        layout: :block,
        class:  "other class",
        data:   [val: "value", other_val: "other value"]
      )
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

  test "outline button with block of safe text is rendered properly" do
    for context <- @contexts do
      expected =
        ~s(<button class="btn btn-#{context}-outline" type="button">) <>
          ~s(<span><b>Bold</b> and <i>italic</i> text</span>)         <>
        ~s(</button>)

      rendered =
        bh_button_outline(context: context) do
          {:safe, ["<span><b>Bold</b> and <i>italic</i> text</span>"]}
        end
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end
end
