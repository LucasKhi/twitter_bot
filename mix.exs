defmodule TwitterBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :twitter_bot,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {TwitterBot.Application, []}
    ]
  end

  defp deps do
    [
      {:oauth, "~> 2.1"},
      {:jason, "~> 1.1"},
      {:twitter, "~> 0.1.0"},
      {:oauther, "~> 1.3"},
      {:poison, "~> 4.0"},
      {:httpoison, "~> 1.8"},
      {:timex, "~> 3.7"}
    ]
  end
end
