defmodule Bh.Mixfile do
  use Mix.Project

  @version "0.0.14"

  def project do
    [
      app: :bh,
      version: version(),
      elixir: "~> 1.3",
      package: package(),
      description: description(),
      source_url: "https://github.com/kovpack/bh",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  def description do
    """
    Twitter Bootstrap 4 and Bootstrap 3 helpers for Phoenix.
    """
  end

  def version, do: @version

  defp deps do
    [
      {:phoenix_html, "~> 2.9.3"},
      {:ex_doc, "~> 0.14.5", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :bh,
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Anatoliy Yevpack"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/kovpack/bh",
        "Live examples" => "https://kovpack.github.io/bh/"
      }
    ]
  end
end
