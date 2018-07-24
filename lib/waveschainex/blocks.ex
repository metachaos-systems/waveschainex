defmodule Waveschainex.Block do
  use Tesla

  @doc """
  Get block at specified height
  """
  @spec at(Tesla.Env.client(), integer(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def at(client, height, _opts \\ []) do
    get(client, "/blocks/at/#{height}")
  end
end
