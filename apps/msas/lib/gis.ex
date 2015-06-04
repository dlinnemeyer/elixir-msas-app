defmodule Msas.Gis do
    use GenServer

    ## Client API

    def start_link(opts \\ []) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    def get(server, msa) do
        GenServer.call(server, {:get, msa})
    end



    ## Server API

    def init(:ok) do
        {:ok, []}
    end

    def handle_call({:get, msa}, _from, state) do
        {:reply, get_gis(msa), state}
    end

    def handle_cast(_msg, state) do
        {:noreply, state}
    end



    ## underlying functionality

    defp get_gis(msa) do
        query = """
SELECT areaid,
    ST_X(ST_Centroid(shapesimp)) as long,
    ST_Y(ST_Centroid(shapesimp)) as lat
FROM live.us_area_2014_4
WHERE level = 'MSA' AND areaid = $1
"""
        %{rows: [result | _]} = Ecto.Adapters.SQL.query(Msas.Postgres, query, [msa])
        {areaid, long, lat} = result
        %{areaid: areaid, centroid: %{lat: lat, long: long}}
    end

end

defmodule Msas.Postgres do
    use Ecto.Repo,
        otp_app: :msas
end
