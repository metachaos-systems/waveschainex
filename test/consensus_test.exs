defmodule Waveschainex.ConsensusTest do
  use ExUnit.Case
  import Waveschainex.Consensus
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get consensus algo", %{client: client} do
    {:ok, env} = algo(client)

    assert %{consensus_algo: _} = env.body
  end
end
