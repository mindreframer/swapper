defmodule Multi.KV do
  use GenServer

  def start_link() do
    start_link(1)
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok)
  end

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  def add(pid, k, v) do
    GenServer.call(pid, {:add, k, v})
  end

  def run(pid, v) do
    GenServer.call(pid, {:run, v})
  end

  def list(pid) do
    GenServer.call(pid, :list)
  end

  @impl true
  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:add, k, v}, from, state) do
    state = Map.put(state, k, v)
    IO.inspect(from)
    {:reply, state, state}
  end

  @impl true
  def handle_call({:run, v}, _from, state) do
    {:reply, Multi.Dynamic.run(v), state}
  end
end
