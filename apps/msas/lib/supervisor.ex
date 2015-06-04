defmodule Msas.Supervisor do
    use Supervisor

    def start_link do
        Supervisor.start_link(__MODULE__, :ok)
    end

    def init(:ok) do
        supervise([
            worker(Msas.Gis, [[name: Msas.Gis]]),
            worker(Msas.Meta, [[name: Msas.Meta]]),
            worker(Msas.Postgres, []),
            worker(Msas.MySQL, []),
        ], strategy: :one_for_one)
    end
end
