defmodule Waveschainex.AddressTest do
  use ExUnit.Case
  import Waveschainex.Address
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get balance for address", %{client: client} do
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = balance(client, address)

    assert %{address: _, balance: _, confirmations: _} = env.body
  end

  test "get data for address", %{client: client} do
    # FIXME: update address to one that has data transactions on mainnet 
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = data(client, address)

    assert env.body == []
  end
end
