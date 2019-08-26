# Swapper
`Swapper` is a little utility to allow you swapping module in test enviroment in a way that works across different processes.

Most of the mocking libraries restrict you by either swapping modules globally (slow) or swapping it only for the current process (limiting advanced cases).


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `swapper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:swapper, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/swapper](https://hexdocs.pm/swapper).



## Alternatives
- [Mock](https://github.com/jjh42/mock) - Mock has a global effect, requieres `async: false` for your ExUnit tests.
- [MockHttpServer](https://github.com/sriedel/mock_http_server)
- [Swap](https://github.com/madeinussr/swap) - The library that allows you to swap modules implementations in your app. Very handy for testing purposes.
- [Syringe](https://github.com/skylerparr/syringe) - Syringe is a injection framework that also opens the opportunity for clearer mocking and to run mocked test asynchronously.
