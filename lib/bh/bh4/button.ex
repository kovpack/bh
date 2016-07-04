defmodule Bh.Bh4.Button do
  @moduledoc """
  Twitter Bootstrap 4 button helpers for Phoenix.
  """

  use Phoenix.HTML

  @default :primary

  @contexts [@default, :secondary, :success, :info, :warning, :danger, :link]

  @doc """
  Generates primary button markup.

  Resulting HTML:

      <button class="btn btn-primary" type="button">Button</button>
  """
  def bh_button(text), do: bh_button(text, context: @default)

  @doc """
  Generates contextual button markup.

  Supported contexts: `:primary`, `:secondary`, `:success`, `:info`, `:warning`,
  `:danger`, `:link`.

  Call `bh_button "Button", context: :success` generates:

      <button class="btn btn-success" type="button">Button</button>
  """
  def bh_button(text, context: context) when context in @contexts do
    content_tag :button, type: "button", class: "btn btn-#{context}" do
      text
    end
  end
  def bh_button(_, context: _) do
    raise ArgumentError, message: "Unsupported button context"
  end

  @doc """
  Generates primary outline button.

  Resulting HTML markup:

      <button class="btn btn-primary-outline" type="button">Button</button>
  """
  def bh_button_outline(text), do: bh_button_outline(text, context: @default)

  @doc """
  Generates contextual outline button HTML markup.

  Supported contexts: `:primary`, `:secondary`, `:success`, `:info`, `:warning`,
  `:danger`, `:link`.

  Call `bh_button_outline "Button", context: :success` generates:

      <button class="btn btn-success-outline" type="button">Button</button>
  """
  def bh_button_outline(text, context: context) when context in @contexts do
    content_tag :button, type: "button", class: "btn btn-#{context}-outline" do
      text
    end
  end
  def bh_button_outline(_, context: _) do
    raise ArgumentError, message: "Unsupported button context"
  end
end
