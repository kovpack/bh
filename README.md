# Bh

Twitter Bootstrap 4 & Twitter Bootstrap 3 helpers for Phoenix.

This package is designed to minimize repetitive code and the amount of HTML
markup in your project's source code.

Package is greatly inspired by [bh](https://github.com/Fullscreen/bh) gem
for Rails (so this package even took the same name, however, API is different
so do not expect to find exactly the same stuff).

Real live examples can be found on the site of the
[Project](https://kovpack.github.io/bh/).

Full API documentation is available on
[Hexdocs](https://hexdocs.pm/bh/api-reference.html).

**NOTE**: Please, keep in mind, that Twitter Bootstrap source files are not
included into the package and should be installed separately.

## Installation

Package is [available in Hex](https://hex.pm/packages/bh) and can be installed
as:

- Add `:bh` of the needed version to the list of dependencies in `mix.exs`:

```
def deps do
  [{:bh, "~> 0.0.14"}]
end
```

- Use `use Bh` to import all **Bootstrap 4** helpers into needed view:

```
defmodule YourApp.SomeView do
  use YourApp.Web, :view
  use Bh
end
```

If you want to use **Bootstrap 3** helpers, you have to pass an extra option
like this:

```
defmodule YourApp.SomeView do
  use YourApp.Web, :view
  use Bh, bootstrap: 3
end
```

- Now you can use helpers in your view like this:

```
<%= bh_label "Pill text", context: :success %>
```

**NOTE:** keep in mind, that **Bootstrap 3** and **Bootstrap 4** helpers can
have different APIs and may be not compatible, so check documentation or live
examples.

## Licence

MIT
