defmodule Waveschainex.Utils do
  use Tesla, docs: false

  @doc """
  Current Node time (UTC)

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters

  """
  @spec time(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def time(client, _opts \\ []) do
    get(client, "/utils/time")
  end
end
