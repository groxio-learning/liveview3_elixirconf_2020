defmodule Memo.EraserTest do
  use ExUnit.Case

  test "the truth" do
    text = "This is a test"
    steps = 4
    result = Memo.Eraser.new(text, steps)

    assert text == result[:mask_text]
    assert 4 == length(result[:plan])
  end
end
