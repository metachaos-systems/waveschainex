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
end
