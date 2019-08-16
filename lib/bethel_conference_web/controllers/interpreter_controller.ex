defmodule BethelConferenceWeb.InterpreterController do
  use BethelConferenceWeb, :controller

  alias BethelConference.Twilio

  @interpreters (System.get_env("INTERPRETERS") || "[\"+13034567890\"]") |> Jason.decode!()

  def handle_call(conn, %{"From" => from}) do
    response =
      if from in @interpreters do
        Twilio.answer(:moderator)
      else
        Twilio.answer(:participant)
      end

    conn
    |> put_resp_header("Content-Type", "text/xml")
    |> send_resp(:ok, response)
  end

  def handle_call(conn, _params) do
    conn
    |> send_resp(400, "Bad Request")
  end

  def not_implemented(conn, _params) do
    conn
    |> send_resp(501, "Not implemented")
  end
end
