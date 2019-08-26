defmodule Multi.Dynamic do
  alias Swapper.MultiRegistry

  def run(param) do
    mod = MultiRegistry.full_lookup(self(), :dynamic)
    mod.run(param)
  end
end
