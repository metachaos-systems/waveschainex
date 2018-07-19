defmodule WaveschainexTest do
  use ExUnit.Case
  # doctest Waveschainex

  test "get node status" do
    assert =
      {:ok,
       %{
         body: %{
           "blockchainHeight" => _,
           "stateHeight" => _,
           "updatedDate" => _,
           "updatedTimestamp" => _
         }
       }} = Waveschainex.node_status()
  end
end
