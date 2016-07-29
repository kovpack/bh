defmodule Bh.Bh3.PanelTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh3.Panel

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
end
