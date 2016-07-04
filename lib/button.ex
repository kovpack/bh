defmodule Bh.Button do
  use Phoenix.HTML

  @default :primary

  @types [@default, :secondary, :success, :info, :warning, :danger, :link]

  def bh_button(text), do: bh_button(text, type: @default)
  def bh_button(text, type: type) when type in @types do
    content_tag :button, type: "button", class: "btn btn-#{type}" do
      text
    end
  end
  def bh_button(text, type: _) do
    raise ArgumentError, message: "Unsupported button type"
  end

  def bh_button_outline(text), do: bh_button_outline(text, type: @default)
  def bh_button_outline(text, type: type) when type in @types do
    content_tag :button, type: "button", class: "btn btn-#{type}-outline" do
      text
    end
  end
  def bh_button_outline(text, type: _) do
    raise ArgumentError, message: "Unsupported button type"
  end
end
