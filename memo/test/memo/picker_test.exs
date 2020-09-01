defmodule Memo.PickerTest do
  alias Memo.Temporary.Library.Picker
  use ExUnit.Case

  @moduletag :picker

  describe "list api" do
    test "should be non-empty" do
      assert length(Picker.list()) > 0
    end
  end

  @valid_id :macbeth

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

  def get_passages() do
    %{
      futurama: Picker.fetch(:futurama),
      it_crowd: Picker.fetch(:it_crowd),
      macbeth: Picker.fetch(:macbeth),
      hamlet: Picker.fetch(:hamlet)
    }
  end

  describe "next api" do
    setup do
      get_passages()
    end

    test "on first element should return second", %{futurama: futurama, it_crowd: it_crowd} do
      assert Picker.next(futurama) == it_crowd
    end

    test "on final element should return first", %{futurama: futurama, macbeth: macbeth} do
      assert Picker.next(macbeth) == futurama
    end
  end

  describe "prev api" do
    setup do
      get_passages()
    end

    test "on last element should return previous", %{macbeth: macbeth, hamlet: hamlet} do
      assert Picker.prev(macbeth) == hamlet
    end

    test "on first element should return final", %{macbeth: macbeth, futurama: futurama} do
      assert Picker.prev(futurama) == macbeth
    end
  end
end
