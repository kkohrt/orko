defmodule Orko do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Orko.Bot, []),
      worker(Orko.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Orko.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
