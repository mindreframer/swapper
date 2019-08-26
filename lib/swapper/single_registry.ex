defmodule Swapper.SingleRegistry do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  ## API
  def list(), do: GenServer.call(__MODULE__, :list)

  def lookup(this_pid) do
    GenServer.call(__MODULE__, {:lookup, this_pid})
  end

  def full_lookup(this_pid) when is_pid(this_pid) do
    module = lookup(this_pid)
    handle_module(this_pid, module)
  end

  def register(this_pid, module_or_function) do
    GenServer.call(__MODULE__, {:register, this_pid, module_or_function})
  end

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:lookup, this_pid}, _from, pids) do
    {:reply, Map.get(pids, this_pid), pids}
  end

  @impl true
  def handle_call({:register, this_pid, module}, _from, state) do
    new_state = Map.put(state, this_pid, module)
    {:reply, new_state, new_state}
  end

  ## private functions
  defp handle_module(pid, nil) do
    res = Enum.find(pid |> get_ancestors(), fn parent_pid -> lookup(parent_pid) end)

    case res do
      nil -> IO.puts("could not find any registed module for #{inspect(pid)}")
      _ -> res |> lookup()
    end
  end

  defp handle_module(_pid, res) when not is_nil(res) do
    res
  end

  defp get_ancestors(pid) do
    pid |> Process.info() |> get_in([:dictionary, :"$ancestors"])
  end
end
