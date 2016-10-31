# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CurrentTuneChannel < ApplicationCable::Channel
  def subscribed
    stream_from "current_tune#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("current_tune#{params[:room]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
