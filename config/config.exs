import Config

config :twitter, :oauth, [
  consumer_key: "YOUR_CONSUMER_KEY",
  consumer_secret: "YOUR_CONSUMER_SECRET",
  access_token: "YOUR_ACCESS_TOKEN",
  access_token_secret: "YOUR_ACCESS_TOKEN_SECRET"
]

config :twitter_bot, :search_query, "elixir lang"

config :twitter_bot, :tweet_interval, 3600

config :logger, :console, format: "[$level] $message\n"

config :twitter_bot, TwitterBot.Workers.TwitterWorker,
  max_retries: 3,
  retry_interval: 1000

config :twitter_bot, TwitterBot.Interfaces.CLI,
  search_interval: 300

config :twitter_bot, :supervisor_name, TwitterBot.Supervisor

config :twitter_bot, TwitterBot.Workers.Supervisor,
  workers: [
    {TwitterBot.Workers.TwitterWorker, []}
  ]
