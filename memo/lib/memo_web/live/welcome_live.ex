defmodule MemoWeb.WelcomeLive do
  use MemoWeb, :live_view

  alias Memo.Temporary.Library.Picker

  def mount(_params, _session, socket) do
    {:ok, assign(socket, passage_id: Picker.first_id()) |> load_passage}
  end

  defp load_passage(socket) do
    id = socket.assigns.passage_id
    assign(socket, passage: Picker.fetch(id))
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
    <pre><%= @passage.body %></pre>
    <button phx-click="choose">Choose</button>
    """
  end

  defp previous(socket) do
    current_passage = socket.assigns.passage
    previous_passage = Picker.prev(current_passage)
    assign(socket, passage: previous_passage, passage_id: previous_passage.id)
  end

  defp next(socket) do
    current_passage = socket.assigns.passage
    next_passage = Picker.next(current_passage)
    assign(socket, passage: next_passage, passage_id: next_passage.id)
  end

  def handle_event("previous", _mete, socket) do
    {:noreply, previous(socket)}
  end

  def handle_event("next", _mete, socket) do
    {:noreply, next(socket)}
  end
end
