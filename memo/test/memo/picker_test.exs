defmodule Memo.PickerTest do
  alias Memo.Temporary.Library.Picker
  use ExUnit.Case

  @tag :picker
  describe "list api" do
    test "should be non-empty" do
      assert length(Picker.list()) > 0
    end
  end

  @valid_id :macbeth

  @tag :picker
  describe "fetch api" do
    test "should return a passage given valid id" do
      assert Picker.fetch(@valid_id) == %{
               id: :macbeth,
               name: "Macbeth",
               body: "Out damn spot, out!"
             }
    end
  end
end
