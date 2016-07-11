# Bh

Twitter Bootstrap 4 helpers for Phoenix.

## Installation

Package is [available in Hex](https://hex.pm/packages/bh) and can be installed
as:

- Add `:bh` of the needed version to the list of dependencies in `mix.exs`:

```
def deps do
  [{:bh, "~> 0.0.7"}]
end
```

- Use `use Bh` to import all helpers into needed view:

```
defmodule YourApp.SomeView do
  use YourApp.Web, :view
  use Bh
end
```

- Now you can use helpers in your view like this:

```
<%= bh_label_pill "Pill text", context: :success %>
```

## Licence

MIT
