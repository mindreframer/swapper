defmodule Single.Dynamic do
  alias Swapper.SingleRegistry

  def run(param) do
    mod = SingleRegistry.full_lookup(self())
    mod.run(param)
  end
end
