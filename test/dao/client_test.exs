defmodule SmartwareEx.Dao.ClientTest do
  use ExUnit.Case
  alias SmartwareEx.Dao.Client
  doctest SmartwareEx

  test "smartware_clients" do
    clients = Client.get
    assert is_list clients
  end
end