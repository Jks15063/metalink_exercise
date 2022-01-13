defmodule MetalinkExercise.Repo do
  use Ecto.Repo,
    otp_app: :metalink_exercise,
    adapter: Ecto.Adapters.Postgres
end
