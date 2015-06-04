defmodule MsasServer do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Plug.Adapters.Cowboy.http(MsasServer.Router, [])
  end
end
