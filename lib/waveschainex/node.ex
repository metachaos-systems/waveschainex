defmodule Waveschainex.Node do
  use Tesla

  @doc """
  Get status of the running node

  """
  @spec status(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def status(client, _opts \\ []) do
    get(client, "/node/status")
  end
end
