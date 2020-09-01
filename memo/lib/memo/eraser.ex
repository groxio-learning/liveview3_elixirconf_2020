defmodule Memo.Eraser do
  defstruct mask_text: nil, plan: nil

  @type t :: %__MODULE__{
          mask_text: String.t(),
          plan: list(list(integer))
        }

  def new(text, steps) do
    %__MODULE__{mask_text: text, plan: plan(text, steps)}
  end

  def erase(%__MODULE__{plan: [step | steps], mask_text: text}) do
    %__MODULE__{
      plan: steps,
      mask_text: do_erase(text, step)
    }
  end

  @spec do_erase(String.t(), list(integer)) :: String.t()
  defp do_erase(text, []), do: text

  defp do_erase(text, step) do
    String.graphemes(text)
    |> Enum.with_index(1)
    |> Enum.map(fn {g, index} -> replace(g, index in step) end)
    |> Enum.join()
  end

  defp replace(_g, true), do: "_"
  defp replace(g, false), do: g

  defp plan(text, steps) do
    1..String.length(text)
    |> Enum.shuffle()
    |> Enum.chunk_every(calculate_chuck_size(text, steps))
  end

  defp calculate_chuck_size(text, steps) do
    String.length(text)
    |> Kernel./(steps)
    |> ceil
  end
end
