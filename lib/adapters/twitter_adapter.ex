defmodule TTBOT.Adapters.TwitterAdapter do
  use GenServer

  alias TTBOT.Domain.Tweet

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def handle_call({:post_tweet, tweet_text}, _from, _state) do
    case post_tweet(tweet_text) do
      {:ok, tweet} ->
        {:reply, {:ok, tweet}, _state}
      {:error, message} ->
        {:reply, {:error, message}, _state}
    end
  end

  defp post_tweet(tweet_text) do
    client = Twitter.client([])
    with {:ok, tweet} <- Twitter.tweet(client, tweet_text) do
      Tweet.new(tweet.id_str, tweet.user.screen_name, tweet.text)
      {:ok, tweet}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end
end
