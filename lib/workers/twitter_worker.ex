defmodule TwitterBot.Workers.TwitterWorker do
  use GenServer

  alias TwitterBot.Domain.Tweet
  alias TwitterBot.Adapters.TwitterAdapter

  ## API methods

  def send_tweet(tweet) do
    GenServer.cast(__MODULE__, {:send_tweet, tweet})
  end

  def get_user_timeline(user_id) do
    {:ok, pid} = GenServer.start_link(__MODULE__, [], [])
    GenServer.call(pid, {:get_user_timeline, user_id})
  end

  ## GenServer callbacks

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, %{}}
  end

  def handle_cast({:send_tweet, tweet}, state) do
    TwitterAdapter.send_tweet(tweet)
    {:noreply, state}
  end

  def handle_call({:get_user_timeline, user_id}, _from, state) do
    tweets = TwitterAdapter.get_user_timeline(user_id)
    tweets = Enum.map(tweets, &Tweet.new(&1))
    {:reply, tweets, state}
  end
end
