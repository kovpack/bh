defmodule Bh.Label do
  use Phoenix.HTML

  @default :default

  @types [@default, :primary, :success, :info, :warning, :danger]

  def bh_label(text), do: bh_label(text, type: @default)
  def bh_label(text, type: type) when type in @types do
    content_tag :span, class: "label label-#{type}" do
      text
    end
  end
  def bh_label(text, type: _) do
    raise ArgumentError, message: "Unsupported label type"
  end

  def bh_label_pill(text), do: bh_label_pill(text, type: @default)
  def bh_label_pill(text, type: type) when type in @types do
    content_tag :span, class: "label label-pill label-#{type}" do
      text
    end
  end
  def bh_label_pill(text, type: _) do
    raise ArgumentError, message: "Unsupported label type"
  end
end
