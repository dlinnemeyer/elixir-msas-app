defmodule MsasServer.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "you found the root of the api")
  end

  get "/:code" do
    send_resp(conn, 200, Poison.encode!(%{
        code: code,
        name: Msas.Meta.get(Msas.Meta, code).name,
        centroid: Msas.Gis.get(Msas.Gis, code).centroid
    }))
  end

end
