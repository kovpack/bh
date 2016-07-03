# Bh

Twitter Bootstrap 4 helpers for Phoenix.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

- Add `:bh` to your list of dependencies in `mix.exs`:

    def deps do
      [{:bh, "~> 0.0.1"}]
    end

- Import all `Bh` helpers into needed view:

    defmodule YourApp.SomeView do
      use YourApp.Web, :view
      import Bh
    end

- It is also possible to import only one needed module:

    defmodule YourApp.SomeView do
      use YourApp.Web, :view
      import Bh.Label
    end

- Now you can use helpers in your view like this:

    <%= hb_label_pill "Pill text", type: :success %>

