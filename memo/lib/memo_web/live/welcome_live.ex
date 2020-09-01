defmodule MemoWeb.WelcomeLive do
  use MemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, passage: passage(:it))}
  end

  defp passage(:it) do
    %{
      name: "IT Crowd!",
      body: "Did you try turning it off and on again?"
    }
  end

  defp passage(:futurama) do
    %{
      name: "Futurama",
      body: "There's some good news everybody"
    }
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <h1>Memorize This</h1>
    <h2>
      <button phx-click="previous">Previous</button>
      <%= @passage.name %>
      <button phx-click="next">Next</button>
    </h2>
    """
  end

  defp previous(socket) do
    assign(socket, passage: passage(:futurama))
  end

  def handle_event("previous", _mete, socket) do
    IO.puts("Be bold")
    {:noreply, previous(socket)}
  end

end
