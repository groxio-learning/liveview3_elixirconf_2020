defmodule Memo.PickerTest do
  alias Memo.Temporary.Library.Picker
  use ExUnit.Case

  @tag :picker
  describe "list api" do
    test "should be non-empty" do
      assert length(Picker.list()) > 0
    end
  end
end
