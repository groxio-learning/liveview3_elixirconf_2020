defmodule Memo.Temporary.Library.Picker do
  @moduledoc """
  Picker API. Provides 4 functions:

  * List passages
  * Fetch a passage
  * Get next passage
  * Get prev passage
  """

  @passages [
    %{id: :futurama, name: "Futurama", body: "Good news everyone!", inserted_at: 0},
    %{
      id: :it_crowd,
      name: "IT Crowd",
      body: "Have you tried turning it on and off again?",
      inserted_at: 1
    },
    %{
      id: :hamlet,
      name: "Hamlet",
      body: "To be or not to be, that is the question.",
      inserted_at: 2
    },
    %{id: :macbeth, name: "Macbeth", body: "Out damn spot, out!", inserted_at: 3}
  ]

  @typedoc """
  Id for a passage.
  """
  @type passage_id :: atom

  @typedoc """
  The type of a passage, currently a map.
  """
  @type passage :: map()

  @doc """
  Lists the available passages.
  """
  @spec list() :: [passage()]
  def list() do
    @passages
  end

  @doc """
  Fetches a passage given its id.
  """
  @spec fetch(passage_id) :: passage()
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
