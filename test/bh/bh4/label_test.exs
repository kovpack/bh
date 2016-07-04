defmodule Bh.Bh4.LabelTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh4.Label

  @contexts [:default, :primary, :success, :info, :warning, :danger]

  test "default label is rendered when no context provided" do
    expected = ~s(<span class="label label-default">Text</span>)
    rendered = bh_label("Text") |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all valid label contexts are rendered properly" do
    for context <- @contexts do
      expected = ~s(<span class="label label-#{context}">Text</span>)

      rendered =
        bh_label("Text", context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "raises exception if invalid label context provided" do
    assert_raise ArgumentError, "Unsupported label context", fn ->
      bh_label "Text", context: :unsupported
    end
  end

  test "default label-pill is rendered when no context provided" do
    expected = ~s(<span class="label label-pill label-default">Text</span>)
    rendered = bh_label_pill("Text") |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "all valid label-pill contexts are rendered properly" do
    for context <- @contexts do
      expected = ~s(<span class="label label-pill label-#{context}">Text</span>)

      rendered =
        bh_label_pill("Text", context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "raises exception if invalid label-pill context provided" do
    assert_raise ArgumentError, "Unsupported label context", fn ->
      bh_label_pill "Text", context: :unsupported
    end
  end
end
