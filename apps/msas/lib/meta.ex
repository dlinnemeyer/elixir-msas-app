defmodule Msas.Meta do
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
        {:reply, get_meta(msa), state}
    end

    def handle_cast(_msg, state) do
        {:noreply, state}
    end



    ## underlying functionality

    defp get_meta(msa) do
        query = """
SELECT code, name
FROM def_us_area_2014_4
WHERE level = 'MSA' AND code = ?
"""
        %{rows: [result | _]} = Ecto.Adapters.SQL.query(Msas.MySQL, query, [msa])
        {areaid, name} = result
        %{areaid: areaid, name: name}
    end

end

defmodule Msas.MySQL do
    use Ecto.Repo,
        otp_app: :msas
end
