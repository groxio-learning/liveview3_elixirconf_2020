defmodule MemoWeb.GameLive do
  use MemoWeb, :live_view

  alias Memo.{Library, Eraser}

  def mount(%{"id" => id}, _session, socket) do
    passage = Library.get_passage!(id)
    {:ok, assign(socket, eraser: Eraser.new(passage.body, passage.steps))}
  end

  defp erase(socket) do
    eraser = socket.assigns.eraser
    assign(socket, eraser: Eraser.erase(eraser))
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <h1>Memorize This</h1>
    <pre><%= @eraser.mask_text %></pre>
    <button phx-click="erase">Erase</button>
    """
  end

  def handle_event("erase", _meta, socket) do
    {:noreply, erase(socket)}
  end
end
