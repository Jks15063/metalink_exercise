defmodule MetalinkExercise.Genservers.OpenseaTest do
  use ExUnit.Case, async: true
  import Mox

  alias MetalinkExercise.Genservers.Opensea
  alias MetalinkExercise.OpenseaClientMock

  describe "init/1" do
    test "fetches the the top 10 collections and broadcasts them" do
      # Mox.stub(OpenseaClientMock, :fetch_collections, fn -> {:ok, [:foo]} end)

      expect(OpenseaClientMock, :fetch_collections, fn -> {:ok, [:foo]} end)

      # assert Opensea.init([]) == {:ok, [:foo]}
    end
  end

  describe "handle_info/2" do
  end
end
