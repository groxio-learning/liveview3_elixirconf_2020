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
               body: "Out damn spot, out!",
               inserted_at: 3
             }
    end
  end

  describe "next api" do
    test "on first element should return second" do
      futurama = Picker.fetch(:futurama)
      it_crowd = Picker.fetch(:it_crowd)
      assert Picker.next(futurama) == it_crowd
    end

    test "on final element should return first" do
      macbeth = Picker.fetch(:macbeth)
      futurama = Picker.fetch(:futurama)
      assert Picker.next(macbeth) == futurama
    end
  end

  describe "prev api" do
    test "on last element should return previous" do
      macbeth = Picker.fetch(:macbeth)
      hamlet = Picker.fetch(:hamlet)
      assert Picker.prev(macbeth) == hamlet
    end

    test "on first element should return final" do
      macbeth = Picker.fetch(:macbeth)
      futurama = Picker.fetch(:futurama)
      assert Picker.prev(futurama) == macbeth
    end
  end
end
