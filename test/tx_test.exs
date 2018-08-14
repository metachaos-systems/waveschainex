defmodule Waveschainex.TransactionsTest do
  use ExUnit.Case
  import Waveschainex.Transactions
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get tx data", %{client: client} do
    {:ok, env} =
      info(
        client,
        "2DVtfgXjpMeFf2PQCqvwxAiaGbiDsxDjSdNQkc5JQ74eWxjWFYgwvqzC4dn7iB1AhuM32WxEiVi1SGijsBtYQwn8"
      )

    assert_value env.body == %{
                   amount: 9_999_999_500_000_000,
                   fee: 0,
                   height: 1,
                   id:
                     "2DVtfgXjpMeFf2PQCqvwxAiaGbiDsxDjSdNQkc5JQ74eWxjWFYgwvqzC4dn7iB1AhuM32WxEiVi1SGijsBtYQwn8",
                   recipient: "3PAWwWa6GbwcJaFzwqXQN5KQm7H96Y7SHTQ",
                   signature:
                     "2DVtfgXjpMeFf2PQCqvwxAiaGbiDsxDjSdNQkc5JQ74eWxjWFYgwvqzC4dn7iB1AhuM32WxEiVi1SGijsBtYQwn8",
                   timestamp: 1_465_742_577_614,
                   type: 1
                 }
  end

  test "get unconfirmed transactions", %{client: client} do
    {:ok, env} = unconfirmed(client)
    assert is_list(env.body)
  end

  test "get number of unconfirmed transactions", %{client: client} do
    {:ok, env} = utx_size(client)
    assert %{size: _} = env.body
  end

  test "get transactions involving address with limit", %{client: client} do
    limit = 100
    address = "3PAWwWa6GbwcJaFzwqXQN5KQm7H96Y7SHTQ"
    {:ok, env} = address_limit(client, address, limit)

    assert length(hd(env.body)) == 100
    assert %{id: _, sender: _, timestamp: _, type: _, version: _} = hd(hd(env.body))
  end
end
