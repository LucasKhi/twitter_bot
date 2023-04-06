defmodule TwitterBot.Workers.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      {TwitterBot.Workers.TwitterWorker, []}
    ]

    supervise(children, strategy: :one_for_one, max_restarts: 3, max_seconds: 5)
  end
end
