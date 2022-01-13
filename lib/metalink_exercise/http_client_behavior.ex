defmodule MetalinkExercise.HttpClientBehaviour do
  @callback fetch_collections() :: {:ok, response :: map} | {:error, reason :: term}
end
