defmodule BethelConference.Twilio do
  import ExTwiml

  def answer(:moderator) do
    twiml do
      say("""
      Thank you for providing this valuable service to Bethel guests!
      You will be connected once one of them joins the call.
      """)

      dial time_limit: 120 do
        conference("Bethel Enterpreter",
          muted: false,
          wait_url: "http://twimlets.com/holdmusic?Bucket=com.twilio.music.guitars",
          wait_method: "GET",
          start_conference_on_enter: true,
          end_conference_on_exit: false
        )
      end
    end
  end

  def answer(:participant) do
    twiml do
      say("""
      Thank you for calling Bethel Interpreter Conference Line.
      You will be connected once one of our interpreters joins the call.
      """)

      dial time_limit: 120 do
        conference("Bethel Enterpreter",
          muted: true,
          wait_url: "http://twimlets.com/holdmusic?Bucket=com.twilio.music.guitars",
          wait_method: "GET",
          start_conference_on_enter: false,
          end_conference_on_exit: false
        )
      end
    end
  end
end
