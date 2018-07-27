defmodule Waveschainex.Block do
  use Tesla, docs: false

  @doc """
  Get block at specified height
  """
  @spec at(Tesla.Env.client(), integer(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def at(client, height, _opts \\ []) do
    get(client, "/blocks/at/#{height}")
  end

  @doc """
  Get blockchain height

  """
  @spec height(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def height(client, _opts \\ []) do
    get(client, "/blocks/height")
  end

  @doc """
  Get last block data
  """
  @spec last(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def last(client, _opts \\ []) do
    get(client, "/blocks/last")
  end

  @doc """
  Get block by a specified Base58-encoded signature

  ## Parameters

  - client: Tesla client
  - signature (String.t): Base58-encoded signature
  - opts: Optional parameters
  """
  @spec signature(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def signature(client, signature, _opts \\ []) do
    get(client, "/blocks/signature/#{signature}")
  end
end
