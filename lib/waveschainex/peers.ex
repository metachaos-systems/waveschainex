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

  @doc """
  Blacklisted peers list

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters

  """
  @spec blacklisted_peers(Tesla.Env.client(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def blacklisted_peers(client, _opts \\ []) do
    get(client, "/peers/blacklisted")
  end

  @doc """
  Connected peers list

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters

  """
  @spec connected_peers(Tesla.Env.client(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def connected_peers(client, _opts \\ []) do
    get(client, "/peers/connected")
  end
end
