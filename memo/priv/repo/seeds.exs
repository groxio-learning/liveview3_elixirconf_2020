# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
[
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
] |> Enum.map(fn passage ->
  Memo.Repo.insert!(%Memo.Library.Passage{
    name: passage.name,
    body: passage.body,
    steps: 3
  })
end)
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
