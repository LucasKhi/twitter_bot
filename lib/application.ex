defmodule TTBOT do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      TTBOT.Workers.TwitterWorker
    ]

    opts = [name: TTBOT.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
