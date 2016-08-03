defmodule Bh.Bh3.PanelTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh3.Panel

  @contexts [:default, :primary, :success, :info, :warning, :danger]

  test "renders default panel with only text" do
    expected =
      ~s(<div class="panel panel-default">)          <>
        ~s(<div class="panel-body">Panel text</div>) <>
      ~s(</div>)

    rendered =
      bh_panel("Panel text")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders panel heading" do
    expected =
      ~s(<div class="panel panel-default">)                <>
        ~s(<div class="panel-heading">Panel heading</div>) <>
        ~s(<div class="panel-body">)                       <>
          ~s(Panel text)                                   <>
        ~s(</div>)                                         <>
      ~s(</div>)

    rendered =
      bh_panel("Panel text", heading: "Panel heading")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end


  test "renders title heading for the panel" do
    expected =
      ~s(<div class="panel panel-default">)            <>
        ~s(<div class="panel-heading">)                <>
          ~s(<h3 class="panel-title">Panel title</h3>) <>
        ~s(</div>)                                     <>
        ~s(<div class="panel-body">)                   <>
          ~s(Panel text)                               <>
        ~s(</div>)                                     <>
      ~s(</div>)

    rendered =
      bh_panel("Panel text", title: "Panel title")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders heading, content and footer" do
    expected =
      ~s(<div class="panel panel-default">)              <>
        ~s(<div class="panel-heading">)                  <>
          ~s(<h3 class="panel-title">Panel title</h3>)   <>
        ~s(</div>)                                       <>
        ~s(<div class="panel-body">)                     <>
          ~s(Panel content)                              <>
        ~s(</div>)                                       <>
        ~s(<div class="panel-footer">Panel footer</div>) <>
      ~s(</div>)

    opts = [
      title: "Panel title",
      footer: "Panel footer"
    ]

    rendered =
      bh_panel("Panel content", opts)
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders panel with different contexts" do
    for context <- @contexts do
      expected =
        ~s(<div class="panel panel-#{context}">)       <>
          ~s(<div class="panel-body">Panel text</div>) <>
        ~s(</div>)

      rendered =
        bh_panel("Panel text", context: context)
        |> Phoenix.HTML.safe_to_string

        assert rendered == expected
    end
  end
end
