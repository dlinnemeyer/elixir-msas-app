defmodule Msas do
    use Application

    def start(_type, _args) do
        Msas.Supervisor.start_link
    end

end
