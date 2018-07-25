defmodule Waveschainex.Asset do
  use Tesla

  @doc """
  Account balance by given asset

  ## Parameters

  - client: Tesla client
  - address (String.t): Address
  - asset_id (String.t): Asset ID
  - opts: Optional parameters

  """
  @spec balance(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def balance(client, address, asset_id, _opts \\ []) do
    get(client, "/assets/balance/#{address}/#{asset_id}")
  end

  @doc """
  Account's balances for all assets

  ## Parameters

  - client : Tesla client
  - address (String.t): Address
  - opts: Optional parameters

  """
  @spec balances(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def balances(client, address, _opts \\ []) do
    get(client, "/assets/balance/#{address}")
  end
end
