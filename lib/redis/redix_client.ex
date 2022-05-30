defmodule Cache.Redis.RedixClient do
  alias Cache.ApiToConfig

  @pool_size ApiToConfig.get_pool_size()

  def set_key_in_cache(key, value), do: command(["SET", key, value])

  def set_key_in_cache(key, value, expiry), do: command(["SETEX", key, expiry, value])

  def get_value_from_cache(key), do: command(["GET", key])

  def command(command) do
    Redix.command(:"redix_#{random_index()}", command)
  end

  defp random_index() do
    Enum.random(0..(@pool_size - 1))
  end
end
