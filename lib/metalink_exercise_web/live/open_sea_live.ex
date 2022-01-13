defmodule MetalinkExerciseWeb.OpenSeaLive do
  use MetalinkExerciseWeb, :live_view

  alias MetalinkExercise.Genservers.Opensea

  def mount(_params, _session, socket) do
    Opensea.subscribe()
    {:ok, assign(socket, :top_10, [])}
  end

  def handle_info(top_10, socket) when is_list(top_10) do
    {:noreply, assign(socket, top_10: top_10)}
  end

  def render(assigns) do
    ~L"""
        <h1>OpenSea Top 10 Collections</h1>
        <table>
            <tbody phx-update="replace" id="top_10">
                <%= for collection <- @top_10 do %>
                    <tr class="collection-row" id="<%= collection["slug"] %>">
                        <td><%= collection["slug"] %></td>
                    </tr>
                <% end %>
            </tbody>
        </table>
    """
  end
end
