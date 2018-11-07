defmodule SmartwareEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :smartware_ex,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SmartwareEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "2.2.11"},
      {:mariaex, "0.8.0"},
      {:httpoison, "~> 1.4"},
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"}
    ]
  end
end
