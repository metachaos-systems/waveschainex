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

  test "get asset details", %{client: client} do
    asset_id = "BrjUWjndUanm5VsJkbUip8VRYy6LWJePtxya3FNv4TQa"
    {:ok, env} = details(client, asset_id)

    assert env.body == %{
             asset_id: "BrjUWjndUanm5VsJkbUip8VRYy6LWJePtxya3FNv4TQa",
             complexity: 0,
             decimals: 8,
             description: "Zcash token",
             extra_fee: 0,
             issue_height: 693_041,
             issue_timestamp: 1_507_028_599_362,
             issuer: "3PAfgHQPgodM6MxUzqRkepiKofGnECNoxt5",
             min_sponsored_asset_fee: nil,
             name: "Zcash",
             quantity: 2_100_000_000_000_000,
             reissuable: false,
             script: nil,
             script_text: nil
           }
  end

  test "get balance distribution by account", %{client: client} do
    asset_id = "BrjUWjndUanm5VsJkbUip8VRYy6LWJePtxya3FNv4TQa"
    {:ok, env} = balance_distribution(client, asset_id)

    {random_account, _} = hd(Enum.into(env.body, []))

    assert is_map(env.body)
    assert is_binary(random_account)
  end
end
