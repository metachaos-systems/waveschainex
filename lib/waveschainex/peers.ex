defmodule Waveschainex.Peers do
  use Tesla

  @doc """
  Peer list

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters

  """
  @spec all_peers(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def all_peers(client, _opts \\ []) do
    get(client, "/peers/all")
  end
end
