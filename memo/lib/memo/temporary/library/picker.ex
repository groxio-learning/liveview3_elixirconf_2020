defmodule Memo.Temporary.Library.Picker do
  @moduledoc """
  Picker API. Provides 4 functions:

  * List passages
  * Fetch a passage
  * Get next passage
  * Get prev passage
  """

  @passages [
    %{id: :futurama, name: "Futurama", body: "Good news everyone!"},
    %{id: :it_crowd, name: "IT Crowd", body: "Have you tried turning it on and off again?"},
    %{id: :hamlet, name: "Hamlet", body: "To be or not to be, that is the question."},
    %{id: :macbeth, name: "Macbeth", body: "Out damn spot, out!"}
  ]

  def list() do
    @passages
  end

  def fetch(id) do
    @passages |> Enum.find(fn %{id: cid} -> cid == id end)
  end

  def next(id) do
    nil
  end

  def prev(id) do
    nil
  end
end
