defmodule Bh.Label do
  use Phoenix.HTML

  @default :default

  @contexts [@default, :primary, :success, :info, :warning, :danger]

  def bh_label(text), do: bh_label(text, context: @default)
  def bh_label(text, context: context) when context in @contexts do
    content_tag :span, class: "label label-#{context}" do
      text
    end
  end
  def bh_label(text, context: _) do
    raise ArgumentError, message: "Unsupported label context"
  end

  def bh_label_pill(text), do: bh_label_pill(text, context: @default)
  def bh_label_pill(text, context: context) when context in @contexts do
    content_tag :span, class: "label label-pill label-#{context}" do
      text
    end
  end
  def bh_label_pill(text, context: _) do
    raise ArgumentError, message: "Unsupported label context"
  end
end
