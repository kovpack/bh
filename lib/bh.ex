defmodule Bh do
  @moduledoc """
  Twitter Bootstrap 4 helpers for Phoenix.

  This package is designed to minimize repetitive code and the amount of HTML
  markup in your project's source code.

  ## Installation:

  Add this package to the list of dependencies in your project's `mix.exs` file:

      def deps do
        [{:bh, "~> #{Bh.Mixfile.version}"}]
      end

  ## Usage

  Use `use Bh` in your view file to import all helpers at once:

      defmodule YourApp.SomeView do
        use YourApp.Web, :view
        use Bh
      end

  Now you can use all helpers directly calling `bh_label/1`, `bh_label/2` etc.
  E.g., if you need Bootstrap 4 pill label, instead of adding this HTML

      <span class="label label-pill label-default">Default pill label</span>

  to your code, you can simply use helper for this:

      <%= bh_label_pill "Default pill label" %>

  Or if you need other type of pill, you can specify its type:

      <%= bh_label_pill "Danger pill label", context: :danger %>

  Which will result in such markup:

      <span class="label label-pill label-danger">Danger pill label</span>
  """

  defmacro __using__(_) do
    quote do
      import Bh.Label
      import Bh.Button
    end
  end
end
