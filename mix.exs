defmodule Bh.Mixfile do
  use Mix.Project

  @version "0.0.8"

  def project do
    [
      app: :bh,
      version: version,
      elixir: "~> 1.3",
      package: package,
      description: description,
      source_url: "https://github.com/kovpack/bh",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [applications: [:logger]]
  end

  def description do
    """
    Twitter Bootstrap 4 helpers for Phoenix.
    """
  end

  def version, do: @version

  defp deps do
    [
      {:phoenix_html, "~> 2.6"},
      {:ex_doc, "~> 0.12", only: :dev}
    ]
  end

  defp package do
    [
      name: :bh,
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Anatoliy Yevpack"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kovpack/bh"}
    ]
  end
end
