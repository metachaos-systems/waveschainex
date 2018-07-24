defmodule Waveschainex.BlockTest do
  use ExUnit.Case
  import Waveschainex.Block
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "get block at", %{client: client} do
    {:ok, env} = at(client, 1000)

    assert_value env.body == %{
                   blocksize: 369,
                   fee: 1,
                   generator: "3PAGPDPqnGkyhcihyjMHe9v36Y4hkAh9yDy",
                   height: 1000,
                   nxt_consensus: %{
                     base_target: 687_867_219,
                     generation_signature: "A2TnQMGP8UR6B6EyNUaxo3hEj5qx7gE7DxVGdw2touoA"
                   },
                   reference:
                     "2LDaQcsu94Jow4dXAQGQy8ktmwq9t4M7mKqNU713hWRtBR69EdhYPJY9gRNkQE8TrZxHrf2gXsMWrv9FwqF6KV8",
                   signature:
                     "4nzFPfeBf1GkgEH7TRXLTxQYvwW3K35HgsEYYFrm4VPxSdtBQy988fXow9eqb1DBen6NnEtn7KiMQ421RvBSjnaZ",
                   timestamp: 1_465_806_677_416,
                   transaction_count: 1,
                   transactions: [
                     %{
                       amount: 50_000_000_000,
                       fee: 1,
                       id:
                         "TNJFQhjYhVTYGf6RKjFZGw7T4YpX4H1QzsQnyqSkn5ZJ8tyKPE7CPbVitiDtXZTyokKTEZq1L3b6XZt49r6Vy2P",
                       recipient: "3P2QFKqhAMWs9sdZYVdQ8RRcPYwwCeYA8Sa",
                       sender: "3PESyRqYseiNymihU6PQErafFGyDEDUMVe1",
                       sender_public_key: "8T2XSvSKn92a5tjeiXoNQPmSv4edkNHJ6WifDjxmvBP6",
                       signature:
                         "TNJFQhjYhVTYGf6RKjFZGw7T4YpX4H1QzsQnyqSkn5ZJ8tyKPE7CPbVitiDtXZTyokKTEZq1L3b6XZt49r6Vy2P",
                       timestamp: 1_465_806_651_759,
                       type: 2
                     }
                   ],
                   version: 2
                 }
  end

  test "get height", %{client: client} do
    {:ok, env} = height(client, 1000)

    assert %{height: height} = env.body
    assert is_integer(height)
  end
end
