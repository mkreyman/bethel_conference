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

    post("/interpreter", InterpreterController, :handle_call)
    post("/*anything", InterpreterController, :not_implemented)
    get("/*anything", InterpreterController, :not_implemented)
  end
end
