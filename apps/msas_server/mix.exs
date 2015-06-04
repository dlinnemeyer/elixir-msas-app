defmodule MsasServer.Mixfile do
  use Mix.Project

  def project do
    [app: :msas_server,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :msas, :cowboy, :plug, :poison],
     mod: {MsasServer, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:msas, in_umbrella: true},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.12"},
      {:poison, "~> 1.4.0"}
    ]
  end
end
