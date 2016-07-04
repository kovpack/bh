defmodule Bh.Button do
  use Phoenix.HTML

  @default :primary

  @contexts [@default, :secondary, :success, :info, :warning, :danger, :link]

  def bh_button(text), do: bh_button(text, context: @default)
  def bh_button(text, context: context) when context in @contexts do
    content_tag :button, type: "button", class: "btn btn-#{context}" do
      text
    end
  end
  def bh_button(text, context: _) do
    raise ArgumentError, message: "Unsupported button context"
  end

  def bh_button_outline(text), do: bh_button_outline(text, context: @default)
  def bh_button_outline(text, context: context) when context in @contexts do
    content_tag :button, type: "button", class: "btn btn-#{context}-outline" do
      text
    end
  end
  def bh_button_outline(text, context: _) do
    raise ArgumentError, message: "Unsupported button context"
  end
end
