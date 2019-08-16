defmodule BethelConferenceWeb.InterpreterController do
  use BethelConferenceWeb, :controller

  alias BethelConference.Twilio

  @interpreters System.get_env("INTERPRETERS") |> Jason.decode!()

  def incoming(conn, %{"To" => _to, "From" => from}) do
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
end
