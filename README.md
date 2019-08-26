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



## Alternatives - general
- [Mox](https://github.com/plataformatec/mox) - Mox is a library for defining concurrent mocks in Elixir.
- [Mock](https://github.com/jjh42/mock) - Mock has a global effect, requieres `async: false` for your ExUnit tests.
- [Mockery](https://github.com/appunite/mockery) - Simple mocking library for asynchronous testing in Elixir.
- [Swap](https://github.com/madeinussr/swap) - The library that allows you to swap modules implementations in your app. Very handy for testing purposes.
- [Syringe](https://github.com/skylerparr/syringe) - Syringe is a injection framework that also opens the opportunity for clearer mocking and to run mocked test asynchronously.
- [Dummy](https://github.com/Vesuvium/dummy) - An Elixir mocking library that makes sense by exposing meck in the right way
- [Placebo](https://github.com/bbalser/Placebo) - Placebo is a mocking library based on meck.


## Alternatives - HTTP services
- [MockHttpServer](https://github.com/sriedel/mock_http_server) - A mocked http server for unit testing in Elixir
- [Mockingbird](https://github.com/Driftrock/mockingbird) - A set of helpers to create http-aware modules that are easy to test.
- [Http Mock Pal](https://github.com/matteosister/http_mock_pal) - An elixir app to start up a mock server to act like external services you are trying to test or mock.
- [ExVCR](https://github.com/parroty/exvcr) - HTTP request/response recording library for elixir, inspired by VCR.
- [Bypass](https://github.com/pspdfkit-labs/bypass) - Bypass provides a quick way to create a custom plug that can be put in place instead of an actual HTTP server to return prebaked responses to client requests.
