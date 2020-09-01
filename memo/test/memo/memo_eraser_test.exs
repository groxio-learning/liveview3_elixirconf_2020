defmodule Memo.EraserTest do
  use ExUnit.Case

  test "the truth" do
    text = "This is a test"
    steps = 4
    result = Memo.Eraser.new(text, steps)

    assert text == result.mask_text
    assert 4 == length(result.plan)
  end

  test "erase one step works" do
    eraser = %Memo.Eraser{
      mask_text: "This is a test",
      plan: [
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        [11, 12, 13, 14]
      ]
    }

    eraser1 = Memo.Eraser.erase(eraser)
    assert eraser1.mask_text == "_____is a test"
    assert length(eraser1.plan) == 2

    assert eraser1.plan == [
             [6, 7, 8, 9, 10],
             [11, 12, 13, 14]
           ]

    eraser2 = Memo.Eraser.erase(eraser1)
    assert eraser2.mask_text == "__________test"
    assert length(eraser2.plan) == 1

    assert eraser2.plan == [
             [11, 12, 13, 14]
           ]

    eraser3 = Memo.Eraser.erase(eraser2)
    assert eraser3.mask_text == "______________"
    assert length(eraser3.plan) == 0
    assert eraser3.plan == []
  end
end
