defmodule BethelConferenceWeb.Router do
  use BethelConferenceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BethelConferenceWeb do
    pipe_through :api
  end

  scope "/", BethelConferenceWeb do
    pipe_through(:api)

    post("/interpreter", InterpreterController, :incoming)
  end
end
