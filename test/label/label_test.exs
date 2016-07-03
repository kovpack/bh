defmodule Bh.LabelTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Label

  @types [:default, :primary, :success, :info, :warning, :danger]

  test "default label is rendered when no type provided" do
    expected = ~s(<span class="label label-default">Text</span>)
    rendered = Phoenix.HTML.safe_to_string(bh_label("Text"))

    assert rendered == expected
  end

  test "all valid label types are rendered properly" do
    for type <- @types do
      expected = ~s(<span class="label label-#{type}">Text</span>)
      rendered = Phoenix.HTML.safe_to_string(bh_label("Text", type: type))

      assert rendered == expected
    end
  end

  test "raises exception if invalid label type provided" do
    assert_raise ArgumentError, "Unsupported label type", fn ->
      bh_label("Text", type: :unsupported)
    end
  end

  test "default label-pill is rendered when no type provided" do
    expected = ~s(<span class="label label-pill label-default">Text</span>)
    rendered = Phoenix.HTML.safe_to_string(bh_label_pill("Text"))

    assert rendered == expected
  end

  test "all valid label-pill types are rendered properly" do
    for type <- @types do
      expected = ~s(<span class="label label-pill label-#{type}">Text</span>)
      rendered = Phoenix.HTML.safe_to_string(bh_label_pill("Text", type: type))

      assert rendered == expected
    end
  end

  test "raises exception if invalid label-pill type provided" do
    assert_raise ArgumentError, "Unsupported label type", fn ->
      bh_label_pill("Text", type: :unsupported)
    end
  end
end
