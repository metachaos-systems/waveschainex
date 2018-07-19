defmodule Waveschainex do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://nodes.wavesplatform.com"
  plug Tesla.Middleware.JSON

  @moduledoc """
  Documentation for Waveschainex.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Waveschainex.hello
      :world

  """
end
