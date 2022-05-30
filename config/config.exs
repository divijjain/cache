import Config

config :cache, Cache.ApiToConfig,
  caching_pool_sup: Cache.Redis.RedixSupervisor,
  caching_client: Cache.Redis.RedixClient,
  pool_size: 5
