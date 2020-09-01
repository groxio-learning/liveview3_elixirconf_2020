defmodule Memo.Library.Passage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "passages" do
    field :body, :string
    field :name, :string
    field :steps, :integer

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:name, :body, :steps])
    |> validate_required([:name, :body, :steps])
    |> validate_length(:body, min: 4)
  end
end
