defmodule Bh.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bh,
      version: "0.0.1",
      elixir: "~> 1.2",
      package: package,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
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
