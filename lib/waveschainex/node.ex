defmodule Waveschainex.Node do
  use Tesla, docs: false

  @doc """
  Get status of the running node

  """
  @spec status(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def status(client, _opts \\ []) do
    get(client, "/node/status")
  end

  @doc """
  Get Waves node version
  """
  @spec version(Tesla.Env.client(), keyword()) :: {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def version(client, _opts \\ []) do
    get(client, "/node/version")
  end
end
