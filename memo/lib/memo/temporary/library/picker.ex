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
    |> Enum.sort_by(fn %{inserted_at: ia} -> ia end)
  end

  @doc """
  Fetches a passage given its id.
  """
  @spec fetch(passage_id) :: passage()
  def fetch(id) do
    @passages |> Enum.find(fn %{id: cid} -> cid == id end)
  end

  @doc """
  Fetches the next passage given an id.
  """
  @spec next(passage) :: passage()
  def next(%{inserted_at: ia} = _current_passage) do
    passages = list()

    Enum.find(
      passages,
      hd(passages),
      fn %{inserted_at: cia} = _cpassage ->
        cia > ia
      end
    )
  end

  @doc """
  Fetches the prev passage given an id.
  """
  @spec prev(passage) :: passage()
  def prev(%{inserted_at: ia} = _current_passage) do
    passages = list()

    Enum.find(
      passages,
      tl(passages),
      fn %{inserted_at: cia} = _cpassage ->
        cia < ia
      end
    )
  end
end
