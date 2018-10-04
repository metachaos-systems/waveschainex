defmodule Waveschainex.Asset do
  use Tesla, docs: false, only: ~w(get)a

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

  @doc """
  Provides detailed information about given asset

  ## Parameters

  - client : Tesla client
  - asset_id (String.t): ID of the asset
  - opts: Optional parameters

  """
  @spec details(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def details(client, asset_id, _opts \\ []) do
    get(client, "/assets/details/#{asset_id}")
  end

  @doc """
  Asset balance distribution by account

  ## Parameters

  - client : Tesla client
  - asset_id (String.t): Asset ID
  - opts: Optional parameters
  """
  @spec balance_distribution(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def balance_distribution(client, asset_id, _opts \\ []) do
    get(client, "/assets/#{asset_id}/distribution")
  end
end
