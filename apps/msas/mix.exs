defmodule Msas.Mixfile do
  use Mix.Project

  def project do
    [app: :msas,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [:logger, :postgrex, :ecto, :mariaex],
      mod: {Msas, []}  
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
     {:postgrex, "~> 0.8"},
     {:mariaex, ">= 0.0.0"},
     {:ecto, "~> 0.9.0"}
    ]
  end
end
