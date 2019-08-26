defmodule Swapper.MixProject do
  use Mix.Project

  def project do
    [
      app: :swapper,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Swapper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cortex, "~> 0.5", only: [:test, :dev]}
    ]
  end
end
