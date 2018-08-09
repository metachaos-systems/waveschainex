defmodule Waveschainex.AliasTest do
  use ExUnit.Case
  import Waveschainex.Alias
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get address of alias", %{client: client} do
    alias = "0000"
    {:ok, env} = address_of_alias(client, alias)

    assert env.body == %{address: "3PDKVE3GS9mg3a29fdeLUsLHkXvUfQjSZuC"}
  end
end
