defmodule AuthPlug.MixProject do
  use Mix.Project

  def project do
    [
      app: :auth_plug,
      version: "1.2.3",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "Turnkey Auth Plug lets you protect any route in an Elixir/Phoenix App.",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
      # uncomment the following line to run the demo app: mix run --no-halt
      # mod: {AuthPlug.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # JWT sign/verify: github.com/joken-elixir/joken
      {:joken, "~> 2.3.0"},

      # Plug helper functions: github.com/elixir-plug/plug
      {:plug, "~> 1.10.4"},

      # Track coverage: github.com/parroty/excoveralls
      {:excoveralls, "~> 0.13.2", only: :test},

      # See: github.com/dwyl/auth_plug_example
      {:plug_cowboy, "~> 2.3", only: [:dev, :test]},
      {:jason, "~> 1.2.2", only: [:dev, :test]},

      # For publishing Hex.docs:
      {:ex_doc, "~> 0.22.6", only: :dev}
    ]
  end

  defp package() do
    [
      files: ~w(lib/auth_plug.ex lib/auth_plug_optional.ex lib/helpers.ex lib/token.ex LICENSE mix.exs README.md),
      name: "auth_plug",
      licenses: ["GNU GPL v2.0"],
      maintainers: ["dwyl"],
      links: %{"GitHub" => "https://github.com/dwyl/auth_plug"}
    ]
  end
end
