defmodule Waveschainex.Address do
  use Tesla
  @doc """
  Account's balance

  ## Parameters

  - client : Tesla client
  - address (String.t): Address
  - opts: Optional parameters

  """
  @spec balance(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def balance(client, address, _opts \\ []) do
    get(client, "/addresses/balance/#{address}")
  end
end
