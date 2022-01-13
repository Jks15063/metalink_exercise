defmodule MetalinkExercise.Genservers.OpenseaTest do
  use ExUnit.Case, async: true
  import Mox

  alias MetalinkExercise.Genservers.Opensea
  alias MetalinkExercise.OpenseaClientMock

  describe "init/1" do
    test "fetches the the top 10 collections and broadcasts them" do
      collections = [
        %{
          "slug" => "collection_2",
          "stats" => %{
            "average_price" => 0.0,
            "count" => 1.0,
            "floor_price" => 2,
            "market_cap" => 0.0,
            "num_owners" => 1,
            "num_reports" => 0,
            "one_day_average_price" => 0.0,
            "one_day_change" => 0.0,
            "one_day_sales" => 0.0,
            "one_day_volume" => 0.0,
            "seven_day_average_price" => 0.0
          }
        },
        %{
          "slug" => "collection_3",
          "stats" => %{
            "average_price" => 0.0,
            "count" => 1.0,
            "floor_price" => 3,
            "market_cap" => 0.0,
            "num_owners" => 1,
            "num_reports" => 0,
            "one_day_average_price" => 0.0,
            "one_day_change" => 0.0,
            "one_day_sales" => 0.0,
            "one_day_volume" => 0.0,
            "seven_day_average_price" => 0.0
          }
        },
        %{
          "slug" => "collection_1",
          "stats" => %{
            "average_price" => 0.0,
            "count" => 1.0,
            "floor_price" => 1,
            "market_cap" => 0.0,
            "num_owners" => 1,
            "num_reports" => 0,
            "one_day_average_price" => 0.0,
            "one_day_change" => 0.0,
            "one_day_sales" => 0.0,
            "one_day_volume" => 0.0,
            "seven_day_average_price" => 0.0
          }
        }
      ]

      expect(OpenseaClientMock, :fetch_collections, fn ->
        {:ok, %{"collections" => collections}}
      end)

      assert Opensea.init([]) ==
               {:ok,
                [
                  %{
                    "slug" => "collection_3",
                    "stats" => %{
                      "average_price" => 0.0,
                      "count" => 1.0,
                      "floor_price" => 3,
                      "market_cap" => 0.0,
                      "num_owners" => 1,
                      "num_reports" => 0,
                      "one_day_average_price" => 0.0,
                      "one_day_change" => 0.0,
                      "one_day_sales" => 0.0,
                      "one_day_volume" => 0.0,
                      "seven_day_average_price" => 0.0
                    }
                  },
                  %{
                    "slug" => "collection_2",
                    "stats" => %{
                      "average_price" => 0.0,
                      "count" => 1.0,
                      "floor_price" => 2,
                      "market_cap" => 0.0,
                      "num_owners" => 1,
                      "num_reports" => 0,
                      "one_day_average_price" => 0.0,
                      "one_day_change" => 0.0,
                      "one_day_sales" => 0.0,
                      "one_day_volume" => 0.0,
                      "seven_day_average_price" => 0.0
                    }
                  },
                  %{
                    "slug" => "collection_1",
                    "stats" => %{
                      "average_price" => 0.0,
                      "count" => 1.0,
                      "floor_price" => 1,
                      "market_cap" => 0.0,
                      "num_owners" => 1,
                      "num_reports" => 0,
                      "one_day_average_price" => 0.0,
                      "one_day_change" => 0.0,
                      "one_day_sales" => 0.0,
                      "one_day_volume" => 0.0,
                      "seven_day_average_price" => 0.0
                    }
                  }
                ]}
    end
  end

  describe "handle_info/2" do
  end
end
