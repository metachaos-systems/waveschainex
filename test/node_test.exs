defmodule Waveschainex.NodeTest do
  use ExUnit.Case
  import Waveschainex.Node
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get node status", %{client: client} do
    {:ok, env} = status(client)

    assert %{
             blockchain_height: _,
             state_height: _,
             updated_date: _,
             updated_timestamp: _
           } = env.body
  end

  test "get node version", %{client: client} do
    {:ok, env} = version(client)

    assert %{version: "Waves " <> _} = env.body
  end
end
