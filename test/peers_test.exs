defmodule Waveschainex.PeersTest do
  use ExUnit.Case
  import Waveschainex.Peers
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get all peers", %{client: client} do
    {:ok, env} = all_peers(client)

    assert is_list(env.body.peers)
    assert %{address: _, last_seen: _} = hd(env.body.peers)
  end

  test "get blacklisted peers", %{client: client} do
    {:ok, env} = blacklisted_peers(client)

    assert is_list(env.body)
    assert %{hostname: _, reason: _, timestamp: _} = hd(env.body)
  end

  test "get connected peers", %{client: client} do
    {:ok, env} = connected_peers(client)

    assert is_list(env.body.peers)

    assert %{
             address: _,
             application_name: _,
             application_version: _,
             declared_address: _,
             peer_name: _,
             peer_nonce: _
           } = hd(env.body.peers)
  end
end
