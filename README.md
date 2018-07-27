# Waveschainex

![](https://i.imgur.com/tKzTi9N.png)

Waveschainex is an Elixir/Erlang client for Waves REST API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `waveschainex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:waveschainex, "~> 0.1.0"}
  ]
end
```

The docs can be found at [https://hexdocs.pm/waveschainex](https://hexdocs.pm/waveschainex).

## Configuration

Default setting for WAVES nodes API is `https://nodes.wavesnodes.com`.

To configure a custom url use the following config setings:

```
config :waveschainex,
  waves_node_url: "YOUR_CUSTOM_URL"
```


## Implemented API methods

All functions are documented, covered by tests and include typespecs.

### Address module

* `balance(client, address, _opts \\ [])`: Account's balance
* `data(client, address, _opts \\ [])`: Read all data posted by an account using Data Transactions
* `public_key(client, address, _opts \\ [])`: Generate a address from public key

### Block module

* `at(client, height, _opts \\ [])`: Get block at specified height
* `height(client, _opts \\ [])`: Get blockchain height
* `last(client, _opts \\ [])`: Get last block data
* `signature(client, signature, _opts \\ [])`: Get block for specified Base58 signature

### Asset module

* `balance(client, address, asset_id, _opts \\ [])`: Account balance by given asset
* `balances(client, address, _opts \\ [])`: Account's balances for all assets
* `details(client, asset_id, _opts \\ [])`: Provides detailed information about given asset

### Transaction module

* `info(client, id, _opts \\ [])`:  Get transaction info
* `unconfirmed(client, _opts \\ [])`: Get list of unconfirmed transactions

### Node module

* `status(client, _opts \\ [])`: Get status of the running node
* `version(client, _opts \\ [])`: Get Waves node version
