defmodule Memo.Eraser do
  def new(text, steps) do
    %{mask_text: text, plan: plan(text, steps)}
  end

  defp plan(text, steps) do
    0..String.length(text)
    |> Enum.shuffle()
    |> Enum.chunk_every(calculate_chuck_size(text, steps))
  end

  defp calculate_chuck_size(text, steps) do
    String.length(text)
    |> Kernel./(steps)
    |> ceil
  end
end
