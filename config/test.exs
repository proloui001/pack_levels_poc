use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :poc_packlevels, PocPacklevels.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :poc_packlevels, PocPacklevels.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "poc_packlevels_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
