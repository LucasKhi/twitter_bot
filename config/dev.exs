import Config

# Configuração do banco de dados
config :ttbot, TTBOT.Repo,
  username: "postgres",
  password: "postgres",
  database: "ttbot_dev",
  hostname: "localhost",
  pool_size: 10

# Configuração do servidor Phoenix
config :ttbot, TTBOTWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/brunch/bin/brunch",
      "watch",
      "--stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]
