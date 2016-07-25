defmodule Bh.Bh3.ProgressTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh3.Progress

  @contexts [:success, :info, :warning, :danger]

  test "renders progress by default with value 0 percents" do
    expected =
      ~s(<div class="progress">)                                          <>
        ~s(<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="0" ) <>
          ~s(class="progress-bar" role="progressbar" style="width: 0%;">) <>
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
          ~s(class="progress-bar" role="progressbar" style="width: 60%;">) <>
          ~s(<span class="sr-only">60% Complete</span>)                    <>
        ~s(</div>)                                                         <>
      ~s(</div>)
    rendered = bh_progress(percentage: 60) |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders contextual progress bars if context provided" do
    for context <- @contexts do
      expected =
        ~s(<div class="progress">)                                           <>
          ~s(<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="30" ) <>
            ~s(class="progress-bar progress-bar-#{context}" )                <>
            ~s(role="progressbar" style="width: 30%;">)                      <>
            ~s(<span class="sr-only">30% Complete</span>)                    <>
          ~s(</div>)                                                         <>
        ~s(</div>)

      rendered =
        bh_progress(percentage: 30, context: context)
        |> Phoenix.HTML.safe_to_string

      assert rendered == expected
    end
  end
end
