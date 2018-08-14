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

  test "get balance details for address", %{client: client} do
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = balance_details(client, address)

    assert %{
             address: "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5",
             available: _,
             effective: _,
             generating: _,
             regular: _
           } = env.body
  end

  test "get data for address", %{client: client} do
    # FIXME: update address to one that has data transactions on mainnet
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = data(client, address)

    assert env.body == []
  end

    test "get data by key for address", %{client: client} do
    # FIXME: update address to one that has data transactions on mainnet
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = get_data_item(client, address, "key")

    assert env.body == %{error: 304, message: "no data for this key"}
  end


  test "get address from public key", %{client: client} do
    pkey = "9u6mN4kN8U7iQVsyNaru7ko6VV3E3pQ6sqcmmDwM6k7a"
    {:ok, env} = public_key(client, pkey)

    assert env.body == %{address: "3P37MjBgXvzGhuLWy7h2UqudtaeXDGwvssD"}
  end
end
