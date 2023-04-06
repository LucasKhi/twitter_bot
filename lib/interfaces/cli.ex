defmodule TwitterBot.Interfaces.CLI do
  @moduledoc false

  use GenServer

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, [])
  end

  def init(init_arg) do
    {:ok, init_arg}
  end

  ## Método para enviar um tweet
  def send_tweet(text) do
    {:ok, pid} = start_link()
    GenServer.cast(pid, {:send_tweet, text})
  end

  ## Método para capturar tweets de um perfil selecionado
  def capture_tweets(user_id) do
    {:ok, pid} = start_link()
    GenServer.call(pid, {:capture_tweets, user_id})
  end

  # ...

  ## Função para lidar com as mensagens recebidas pelo GenServer
  def handle_cast({:send_tweet, text}, state) do
    tweet = %TwitterBot.Domain.Tweet{text: text}
    TwitterBot.Workers.TwitterWorker.send_tweet(tweet)
    {:noreply, state}
  end

  ## Função para lidar com as mensagens recebidas pelo GenServer
  def handle_call({:capture_tweets, user_id}, _from, state) do
    tweets = TwitterBot.Workers.TwitterWorker.get_user_timeline(user_id)
                |> Enum.map(&TwitterBot.Domain.Tweet.from_twitter_api/1)
    {:reply, tweets, state}
  end

  # ...
end
