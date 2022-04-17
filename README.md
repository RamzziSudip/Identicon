# Identicon

## Demo

> Demo identicon on some words

| | |
| :--: | :--: |
| `banana` ![Identicon of banana](/demo/banana.png) | `coco` ![Identicon of coco](/demo/coco.png) |
| `Jennifer Johnson` ![Identicon of Jennifer Johnson](/demo/Jennifer_Johnson.png) | `Anna Smith` ![Identicon of Anna Smith](/demo/Anna_Smith.png) |

## Installation

[available in Hex](https://hex.pm/packages/identicon2), the package can be installed
by adding `identicon2` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon2, "~> 0.1.0"}
  ]
end
```

## Notes

### EGD - Erlang Graphical Drawer

`:egd` is no longer available in Elixir OTP, so to get around this

mix.exs:

```elixir
{:egd, github: "erlang/egd"}
```

To install dependencies:

```cli
mix deps.clean --all
mix deps.get
mix deps.compile
```

### Generate docs

mix.exs:

```elixir
{:ex_doc, "~> 0.12"}
```

```cli
mix docs
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/identicon2>.

## License & copyright

Copyright © 2022 Sudip Roy, All Rights Reserved

Licensed under the [MIT License](/LICENSE)
