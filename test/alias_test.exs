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

  test "get aliases of address", %{client: client} do
    address = "3PDKVE3GS9mg3a29fdeLUsLHkXvUfQjSZuC"

    {:ok, env} = alias_of_address(client, address)

    first = hd(env.body)
    assert is_list(env.body)
    assert is_binary(first)
    assert String.contains?(first, "alias")
  end
end
