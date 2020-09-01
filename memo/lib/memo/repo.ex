defmodule Memo.Repo do
  use Ecto.Repo,
    otp_app: :memo,
    adapter: Ecto.Adapters.Postgres
end
