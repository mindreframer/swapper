defmodule Single do
  defmodule Dummy1 do
    def run(a) do
      IO.puts("#{__MODULE__} >" <> "#{inspect(a)}")
      a
    end
  end

  defmodule Dummy2 do
    def run(a) do
      IO.puts("#{__MODULE__} >" <> "#{inspect(a)}")
      a
    end
  end
end
