defmodule Waveschainex.ResponseMiddleware do
  @behaviour Tesla.Middleware
  @moduledoc """
  Parses and converts API responses to corresponding Elixir values, idiomatic underscored atom keys, etc.
  """

  def call(env, next, _options) do
    env
    |> Tesla.run(next)
    |> handle_response()
  end

  def handle_response(response) do
    with {:ok, env} <- response do
      env = put_in(env.body, AtomicMap.convert(env.body, %{safe: false}))

      {:ok, env}
    else
      err -> err
    end
  end
end
