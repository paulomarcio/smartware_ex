defmodule SmartwareEx.Wca.Synchronizertest do
  use ExUnit.Case
  alias SmartwareEx.Wca.Synchronizer
  doctest SmartwareEx

  test "update" do
    assert {:ok, :finished} = Synchronizer.update()
  end
end