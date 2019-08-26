defmodule Single.Checker do
  alias Swapper.SingleRegistry
  alias Single.{Dynamic, Dummy1, Dummy2, KV}
  def check_spawn_link do
    SingleRegistry.register(self(), Dummy1)
    Dynamic.run(4545)
    # does not work with spawn / spawn_link,
    # process dictionary is not populated with ancestors
    spawn_link(fn->
      IO.puts "in spawn...#{inspect self()}"
      SingleRegistry.register(self(), Dummy1)
      {:ok, pid} = KV.start_link()
      SingleRegistry.full_lookup(pid) |> IO.inspect()
      KV.run(pid, "3333") |> IO.inspect()
    end)
  end

  def check_task do
    SingleRegistry.register(self(), Dummy1)
    Dynamic.run(4545)
    {:ok, pid} = KV.start_link()
    KV.run(pid, "3333")
    a = Task.async(fn->
      SingleRegistry.register(self(), Dummy2)
      IO.puts "in task async...#{inspect self()}"
      {:ok, pid2} = KV.start_link()
      KV.run(pid2, "3333") # uses it's own mock
      KV.run(pid, "3333") # uses the mock from outer scope
    end)

    res = Task.await(a)
    IO.inspect res


    KV.run(pid, "4444") # still uses the mock from outer scope
  end
end
