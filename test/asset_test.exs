defmodule Waveschainex.AssetTest do
  use ExUnit.Case
  import Waveschainex.Asset
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get asset balance for address", %{client: client} do
    asset_id = "BrjUWjndUanm5VsJkbUip8VRYy6LWJePtxya3FNv4TQa"
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = balance(client, address, asset_id)

    assert %{address: _, asset_id: _, balance: _} = env.body
  end

  test "get all asset balances for address", %{client: client} do
    address = "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5"
    {:ok, env} = balances(client, address)

    assert %{address: _, balances: _} = env.body
  end
end
