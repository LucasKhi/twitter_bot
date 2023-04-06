defmodule TwitterBot do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      TwitterBot.Workers.TwitterWorker
    ]

    opts = [name: TwitterBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
