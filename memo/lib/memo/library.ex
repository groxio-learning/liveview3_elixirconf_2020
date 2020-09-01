defmodule Memo.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias Memo.Repo

  alias Memo.Library.Passage

  @doc """
  Returns the list of passages.

  ## Examples

      iex> list_passages()
      [%Passage{}, ...]

  """
  def list_passages do
    q = from p in Passage, order_by: p.id
    Repo.all(q)
  end

  def first_passage() do
    q = from p in Passage, order_by: p.id, limit: 1
    Repo.one(q)
  end

  def last_passage() do
    q = from p in Passage, order_by: [desc: :id], limit: 1
    Repo.one(q)
  end

  def next(id) do
    q = from p in Passage, order_by: p.id, where: p.id > ^id, limit: 1
    Repo.one(q) || first_passage()
  end

  def prev(id) do
    q = from p in Passage, order_by: [desc: :id], where: p.id < ^id, limit: 1
    Repo.one(q) || last_passage()
  end

  @doc """
  Gets a single passage.

  Raises `Ecto.NoResultsError` if the Passage does not exist.

  ## Examples

      iex> get_passage!(123)
      %Passage{}

      iex> get_passage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_passage!(id), do: Repo.get!(Passage, id)

  @doc """
  Creates a passage.

  ## Examples

      iex> create_passage(%{field: value})
      {:ok, %Passage{}}

      iex> create_passage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_passage(attrs \\ %{}) do
    %Passage{}
    |> Passage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a passage.

  ## Examples

      iex> update_passage(passage, %{field: new_value})
      {:ok, %Passage{}}

      iex> update_passage(passage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_passage(%Passage{} = passage, attrs) do
    passage
    |> Passage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a passage.

  ## Examples

      iex> delete_passage(passage)
      {:ok, %Passage{}}

      iex> delete_passage(passage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_passage(%Passage{} = passage) do
    Repo.delete(passage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking passage changes.

  ## Examples

      iex> change_passage(passage)
      %Ecto.Changeset{data: %Passage{}}

  """
  def change_passage(%Passage{} = passage, attrs \\ %{}) do
    Passage.changeset(passage, attrs)
  end
end
