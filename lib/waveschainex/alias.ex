defmodule Waveschainex.Alias do
  use Tesla
  @doc """
  Returns an address associated with an Alias. Alias should be plain text without an alias prefix and network code.

  ## Parameters

  - client : Tesla client
  - alias (String.t): Alias
  - opts: Optional parameters

  """
  @spec address_of_alias(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def address_of_alias(client, alias, _opts \\ []) do
    get(client, "/alias/by-alias/#{alias}")
  end
end
