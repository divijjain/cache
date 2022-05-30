defmodule Cache.ApiToConfig do
  @moduledoc """
    Ths module acts as an API to the config file
  """

  @compile_config Application.compile_env(:cache, __MODULE__, [])

  def get_caching_service, do: Keyword.fetch!(config(), :caching_pool_sup)

  def get_caching_client, do: Keyword.fetch!(@compile_config, :caching_client)

  def get_pool_size, do: Keyword.fetch!(config(), :pool_size)

  defp config, do: Application.get_env(:cache, __MODULE__, [])
end
