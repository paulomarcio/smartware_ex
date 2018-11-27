defmodule SmartwareEx.Common.ClientTest do
  use ExUnit.Case
  alias SmartwareEx.Common.Client
  doctest SmartwareEx

  test "smartware_clients" do
    clients = Client.get
    assert is_list clients
  end
end