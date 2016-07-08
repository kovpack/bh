defmodule Bh.Bh4.AlertTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh4.Alert

  @contexts [:info, :success, :warning, :danger]

  test "default alert context is :info" do
    expected = ~s(<div class="alert alert-info" role="alert">Alert text</div>)

    rendered =
      bh_alert("Alert text")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "id attribute is rendered in alert" do
    expected =
      ~s(<div class="alert alert-info" id="one" role="alert">Alert text</div>)

    rendered =
      bh_alert("Alert text", id: :one)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all valid alert contexts are rendered properly" do
    for context <- @contexts do
      expected =
        ~s(<div class="alert alert-#{context}" role="alert">Alert text</div>)

      rendered =
        bh_alert("Alert text", context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "alert extra classes rendered properly" do
    expected =
      ~s(<div class="alert alert-info extra" role="alert">Alert text</div>)

    rendered =
      bh_alert("Alert text", class: "extra")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "proper rendering with multiple options" do
    expected =
      ~s(<div class="alert alert-danger extra" id="one" role="alert">) <>
        ~s(Alert text)                                                 <>
      ~s(</div>)

    rendered =
      bh_alert("Alert text", id: :one, class: :extra, context: :danger)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "alert with complex block with safe text is rendered properly" do
    for context <- @contexts do
      expected =
        ~s(<div class="alert alert-#{context} extra" id="one" role="alert">) <>
          ~s(<span><b>Bold</b> and <i>italic</i> text</span>)                <>
        ~s(</div>)

      rendered =
        bh_alert(context: context, id: :one, class: "extra") do
          {:safe, ["<span><b>Bold</b> and <i>italic</i> text</span>"]}
        end
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end
end
