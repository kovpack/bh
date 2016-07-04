defmodule Bh do
  @moduledoc """
  Twitter Bootstrap 4 helpers for Phoenix.

  This package is designed to minimize repetitive code and the amount of HTML
  markup in your project's source code.

  E.g., if you need Bootstrap 4 pill label, instead of adding this HTML

      <span class="label label-pill label-default">Default pill label</span>

  to your code, you can simply use helper for this:

      <%= bh_label_pill "Default pill label" %>

  Or if you need other type of pill, you can specify its type:

      <%= bh_label_pill "Danger pill label", type: :danger %>

  Which will result in such markup:

      <span class="label label-pill label-danger">Danger pill label</span>
  """

  defdelegate bh_label(text), to: Bh.Label
  defdelegate bh_label(text, opts), to: Bh.Label

  defdelegate bh_label_pill(text), to: Bh.Label
  defdelegate bh_label_pill(text, opts), to: Bh.Label
end
