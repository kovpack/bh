defmodule Bh.Bh3.ProgressTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh3.Progress

  test "renders progress by default with value 0 percents" do
    expected =
      ~s(<div class="progress">)                                          <>
        ~s(<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="0" ) <>
          ~s(class="progress-bar" role="progressbar" style="width: 0%;")  <>
         ~s(>)                                                            <>
          ~s(<span class="sr-only">0% Complete</span>)                    <>
        ~s(</div>)                                                        <>
      ~s(</div>)
    rendered = bh_progress |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders progress bar with provided percentage" do
    expected =
      ~s(<div class="progress">)                                           <>
        ~s(<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" ) <>
          ~s(class="progress-bar" role="progressbar" style="width: 60%;")  <>
         ~s(>)                                                             <>
          ~s(<span class="sr-only">60% Complete</span>)                    <>
        ~s(</div>)                                                         <>
      ~s(</div>)
    rendered = bh_progress(percentage: 60) |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end
end
