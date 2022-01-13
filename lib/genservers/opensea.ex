defmodule MetalinkExercise.Genservers.Opensea do
  use GenServer
  require Logger

  @refresh_time 5 * 1000

  def init(_state) do
    top_10 = fetch_top_10()
    notify(top_10)
    refresh_state()
    {:ok, top_10}
  end

  def handle_info(:refresh_state, _state) do
    top_10 = fetch_top_10()
    notify(top_10)
    refresh_state()
    {:noreply, top_10}
  end

  def handle_call(:return_top_10, _from, state) do
    {:reply, state, state}
  end

  # Client functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def return_top_10, do: GenServer.call(__MODULE__, :return_top_10)

  def subscribe() do
    Phoenix.PubSub.subscribe(MetalinkExercise.PubSub, "opensea")
  end

  defp notify(message) do
    Phoenix.PubSub.broadcast(MetalinkExercise.PubSub, "opensea", message)
  end

  defp refresh_state() do
    Process.send_after(self(), :refresh_state, @refresh_time)
  end

  defp fetch_top_10() do
    format_resp(opensea_client().fetch_collections())
  end

  defp format_resp({:ok, %{"collections" => collections}}) do
    collections
    |> Enum.sort_by(fn collection -> collection["stats"]["floor_price"] end, :desc)
    |> Enum.take(10)
  end

  defp format_resp({:error, reason}) do
    Logger.error(reason)
  end

  defp opensea_client, do: Application.get_env(:metalink_exercise, :opensea_client)
end
