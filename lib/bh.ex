defmodule Bh do
  @moduledoc """
  Twitter Bootstrap 4 & Twitter Bootstrap 3 helpers for Phoenix.

  This package is designed to minimize repetitive code and the amount of HTML
  markup in your project's source code.

  **NOTE**: Please, keep in mind, that Twitter Bootstrap source files are not
  included into the package and should be installed separately.

  # Live examples

  Real live examples can be found on the site of the
  [Project](https://kovpack.github.io/bh/).

  # Installation:

  Add this package to the list of dependencies in your project's `mix.exs` file:

      def deps do
        [{:bh, "~> #{Bh.Mixfile.version}"}]
      end

  # Usage

  Use `use Bh` in your view file to import all **Bootstrap 4** (which is
  default) helpers at once:

      defmodule YourApp.SomeView do
        use YourApp.Web, :view
        use Bh
      end

  If you want to use **Bootstrap 3** helpers, you have to pass an extra option
  like this:

      defmodule YourApp.SomeView do
        use YourApp.Web, :view
        use Bh, bootstrap: 3
      end

  **NOTE:** keep in mind, that Bootstrap 3 and Bootstrap 4 helpers can have
  different APIs and may be not compatible, so check documentation or live
  examples.

  Now you can use all helpers directly calling `bh_label/1`, `bh_label/2` etc.

  If you need Bootstrap 4 or Bootstrap 3 standard label, instead of adding this
  HTML to your code (both versions of Bootstrap have the same markup for simple
  labels):

      <span class="label label-default">Default label</span>

  you can simply use helper for this:

      <%= bh_label "Default label" %>

  Or if you need contextual label pill for Bootstrap 4 only, you can use
  `bh_label_pill/2` function having specified also its context:

      <%= bh_label_pill "Danger pill label", context: :danger %>

  Which will result in such markup:

      <span class="label label-pill label-danger">Danger pill label</span>
  """

  defmacro __using__(opts \\ []) do
    if Keyword.has_key?(opts, :bootstrap) && opts[:bootstrap] == 3 do
      quote do
        import Bh.Bh3.Label
        import Bh.Bh3.Badge
        import Bh.Bh3.Icon
        import Bh.Bh3.Alert
        import Bh.Bh3.Progress
        import Bh.Bh3.Button
        import Bh.Bh3.Panel
      end
    else
      quote do
        import Bh.Bh4.Label
        import Bh.Bh4.Button
        import Bh.Bh4.Alert
        import Bh.Bh4.Modal
        import Bh.Bh4.Progress
      end
    end
  end
end
