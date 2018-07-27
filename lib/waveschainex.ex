defmodule Waveschainex do
  use Tesla, docs: false
  @default_url "https://nodes.wavesnodes.com"

  @moduledoc """
  Documentation for Waveschainex.
  """

  @spec client(list(), list()) :: Tesla.Env.client()
  def client(pre \\ [], post \\ []) do
    url = Application.get_env(:waveschainex, :waves_node_url, @default_url)
    Tesla.build_client(
      [
        {Tesla.Middleware.BaseUrl, url}
      ] ++ pre,
      [{Waveschainex.ResponseMiddleware, []}, {Tesla.Middleware.JSON, []}] ++ post
    )
  end
end
