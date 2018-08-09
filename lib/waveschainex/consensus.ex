defmodule Waveschainex.Consensus do
  use Tesla, docs: false

  @doc """
  Shows which consensus algo being using

  ## Parameters

  - client : Tesla client
  - opts: Optional parameters

  """
  @spec algo(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def algo(client, _opts \\ []) do
    get(client, "/consensus/algo")
  end
end
