defmodule Swapper.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Swapper.SingleRegistry,
      Swapper.MultiRegistry
    ]

    opts = [strategy: :one_for_one, name: Swapper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
