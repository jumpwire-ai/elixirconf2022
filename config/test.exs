import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :swiphly, Swiphly.Repo,
  database: Path.expand("../swiphly_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :swiphly, SwiphlyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FIy3nOIG7kIymIlimWfflQjYXa9AVD3V07xX8u/BPdGzEuDSB/lgGQRruaOEcTrf",
  server: false

# In test we don't send emails.
config :swiphly, Swiphly.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
