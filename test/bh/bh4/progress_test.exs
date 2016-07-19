defmodule Bh.Bh4.ProgressTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh4.Progress

  @contexts [:success, :info, :warning, :danger]

  test "renders progress by default with value 0 percents" do
    expected =
      ~s(<progress class="progress" max="100" value="0">0%</progress>)
    rendered = bh_progress |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders progress bar with provided percentage" do
    expected =
      ~s(<progress class="progress" max="100" value="30">30%</progress>)
    rendered = bh_progress(percentage: 30) |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders progress with proper context" do
    for context <- @contexts do
      classes = "progress progress-#{context}"
      expected =
        ~s(<progress class="#{classes}" max="100" value="30">30%</progress>)
      rendered =
        bh_progress(percentage: 30, context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end

  test "renders stripped progress bar if option stripped: true is provided" do
    classes = "progress progress-stripped"
    expected =
      ~s(<progress class="#{classes}" max="100" value="30">30%</progress>)
    rendered =
      bh_progress(percentage: 30, stripped: true)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end
end
