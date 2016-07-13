defmodule Bh.Bh4.Label do
  @moduledoc """
  Twitter Bootstrap 4 label helpers for Phoenix.

  ## Examples

  Real live examples can be found on the site of the
  [Project](https://kovpack.github.io/bh/).
  """

  use Phoenix.HTML

  @default :default

  @contexts [@default, :primary, :success, :info, :warning, :danger]

  @doc """
  Generates default label markup.

  Resulting HTML:
      <span class="label label-default">Label</span>
  """
  def bh_label(text), do: bh_label(text, context: @default)

  @doc """
  Generates contextual label markup.

  Supported contexts: `:default`, `:primary`, `:success`, `:info`, `:warning`,
  `:danger`.

  Call `bh_label "Label", context: :success` generates:

      <span class="label label-success">Label</span>
  """
  def bh_label(text, context: context) when context in @contexts do
    content_tag :span, class: "label label-#{context}" do
      text
    end
  end
  def bh_label(_, context: _) do
    raise ArgumentError, message: "Unsupported label context"
  end

  @doc """
  Generates default pill label markup.

  Resulting HTML:
      <span class="label label-pill label-default">Label</span>
  """
  def bh_label_pill(text), do: bh_label_pill(text, context: @default)

  @doc """
  Generates contextual pill label markup.

  Supported contexts: `:default`, `:primary`, `:success`, `:info`, `:warning`,
  `:danger`.

  Call `bh_label_pill "Label", context: :success` generates:

      <span class="label label-pill label-success">Label</span>
  """
  def bh_label_pill(text, context: context) when context in @contexts do
    content_tag :span, class: "label label-pill label-#{context}" do
      text
    end
  end
  def bh_label_pill(_, context: _) do
    raise ArgumentError, message: "Unsupported label context"
  end
end
