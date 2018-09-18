defmodule Waveschainex.UtilsTest do
  use ExUnit.Case
  import Waveschainex.Utils
  import AssertValue

  setup_all do
    client = Waveschainex.client()

    %{client: client}
  end

  test "gets node time", %{client: client} do
    {:ok, %{body: body}} = time(client)
    assert %{ntp: ntp, system: system} = body
    assert is_integer(ntp) and is_integer(system)
  end
end
