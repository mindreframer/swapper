defmodule Swapper.MultiRegistry do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  ## API
  def list(), do: GenServer.call(__MODULE__, :list)

  def lookup(this_pid, namespace) do
    GenServer.call(__MODULE__, {:lookup, this_pid, namespace})
  end

  def full_lookup(this_pid, namespace) when is_pid(this_pid) do
    module = lookup(this_pid, namespace)
    handle_module(this_pid, namespace, module)
  end

  def register(this_pid, namespace, module_or_function) do
    GenServer.call(__MODULE__, {:register, this_pid, namespace, module_or_function})
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
  def handle_call({:lookup, this_pid, namespace}, _from, state) do
    {:reply, Map.get(state, {this_pid, namespace}), state}
  end

  @impl true
  def handle_call({:register, this_pid, namespace, module}, _from, state) do
    new_state = Map.put(state, {this_pid, namespace}, module)
    {:reply, new_state, new_state}
  end

  ## private functions
  defp handle_module(pid, namespace, nil) do
    res = Enum.find(pid |> get_ancestors(), fn parent_pid -> lookup(parent_pid, namespace) end)

    case res do
      nil -> IO.puts("could not find any registed module for #{inspect(pid)} in #{namespace}") ; nil
      _ -> res |> lookup(namespace)
    end
  end

  defp handle_module(_pid, _namespace, res) when not is_nil(res) do
    res
  end

  defp get_ancestors(pid) do
    pid |> Process.info() |> get_in([:dictionary, :"$ancestors"])
  end
end
