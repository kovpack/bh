defmodule Bh.Bh4.ModalTest do
  use ExUnit.Case, async: true
  use Phoenix.HTML

  import Bh.Bh4.Modal

  test "renders content and footer when only text provided" do
    expected =
      ~s(<div aria-hidden="true" )                      <>
        ~s(aria-labelledby="myModalLabel" )             <>
        ~s(class="modal fade in" )                      <>
        ~s(id="myModal" )                               <>
        ~s(role="dialog" )                              <>
        ~s(tabindex="-1">)                              <>
        ~s(<div class="modal-dialog" role="document">)  <>
          ~s(<div class="modal-content">)               <>
            ~s(<div class="modal-body">)                <>
              ~s(<p>Modal content</p>)                  <>
            ~s(</div>)                                  <>
            ~s(<div class="modal-footer">)              <>
              ~s(<button class="btn btn-secondary" )    <>
                ~s(data-dismiss="modal" type="button">) <>
                ~s(Close)                               <>
              ~s(</button>)                             <>
            ~s(</div>)                                  <>
          ~s(</div>)                                    <>
        ~s(</div>)                                      <>
      ~s(</div>)

    rendered =
      bh_modal("Modal content")
      |> Phoenix.HTML.safe_to_string

    assert rendered == expected
  end

  test "renders properly if only text and id provided" do
    id                  = "myCustomId"
    rendered_aria_label = ~s(aria-labelledby="#{id}Label")
    rendered_id         = ~s(id="#{id}")

    rendered =
      bh_modal("Modal content", id: id)
      |> Phoenix.HTML.safe_to_string

    assert rendered =~ rendered_aria_label
    assert rendered =~ rendered_id
  end
end
