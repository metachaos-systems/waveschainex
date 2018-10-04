defmodule Waveschainex.Alias do
  use Tesla, docs: false, only: ~w(get)a

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

  @doc """
  Returns a collection of aliases associated with an Address

  ## Parameters

  - client : Tesla client
  - address (String.t): 3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7
  - opts: Optional parameters

  """
  @spec alias_of_address(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, Tesla.Env.t()} | {:error, Tesla.Env.t()}
  def alias_of_address(client, address, _opts \\ []) do
    get(client, "/alias/by-address/#{address}")
  end
end
