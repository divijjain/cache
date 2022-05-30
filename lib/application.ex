defmodule Cache.Application do
  use Application

  alias Cache.ApiToConfig

  def start(_type, _args) do
    caching_supervisor = ApiToConfig.get_caching_service()

    children = [caching_supervisor]
    opts = [strategy: :one_for_one, name: Cache.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
