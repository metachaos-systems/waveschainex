defmodule Waveschainex.Transactions do
  use Tesla, docs: false, only: ~w(get)a

  @doc """
  Get transaction info

  ## Parameters

  - client : Tesla client
  - id (String.t): Transaction id
  - opts: Optional parameters

  """
  @spec info(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def info(client, id, _opts \\ []) do
    get(client, "/transactions/info/#{id}")
  end

  @doc """
  Get list of unconfirmed transactions

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters
  """
  @spec unconfirmed(Tesla.Env.client(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def unconfirmed(client, _opts \\ []) do
    get(client, "/transactions/unconfirmed")
  end

  @doc """
  Get list of transactions where specified address has been involved

  ## Parameters

  - client : Tesla client
  - address (String.t): Wallet address
  - limit (integer()): Specified number of records to be returned
  - opts: Optional parameters
  """
  @spec address_limit(Tesla.Env.client(), String.t(), integer(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def address_limit(client, address, limit, _opts \\ []) do
    get(client, "/transactions/address/#{address}/limit/#{limit}")
  end

  @doc """
  Get number of unconfirmed transactions in the UTX pool

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters

  """
  @spec utx_size(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def utx_size(client, _opts \\ []) do
    get(client, "/transactions/unconfirmed/size")
  end

  @doc """
  Get transaction that is in the UTX

  ## Parameters

  - client : Tesla client
  - id (String.t): Transaction id
  - opts: Optional parameters
  """
  @spec utx_transaction_info(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def utx_transaction_info(client, id, _opts \\ []) do
    get(client, "/transactions/unconfirmed/info/#{id}")
  end
end
