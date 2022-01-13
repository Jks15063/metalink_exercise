defmodule MetalinkExercise.OpenseaClient do
  @behaviour MetalinkExercise.HttpClientBehaviour

  @collection_url "https://api.opensea.io/api/v1/collections"

  @impl MetalinkExercise.HttpClientBehaviour
  def fetch_collections() do
    case HTTPoison.get(@collection_url) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
