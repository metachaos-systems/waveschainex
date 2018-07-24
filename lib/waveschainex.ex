defmodule Waveschainex do
  use Tesla

  @moduledoc """
  Documentation for Waveschainex.
  """

  @spec client(list(), list()) :: Tesla.Env.client()
  def client(pre \\ [], post \\ []) do
    Tesla.build_client(
      [
        {Tesla.Middleware.BaseUrl, "https://nodes.wavesplatform.com"},
        {Tesla.Middleware.JSON, []}
      ] ++ pre,
      post
    )
  end
end
