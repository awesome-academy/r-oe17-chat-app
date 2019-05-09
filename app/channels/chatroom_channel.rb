class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel_#{params[:group_id]}"
    stream_from "private_channel_of_#{current_user.id}"

    Subscription.find_or_create_by(group_id: params[:group_id], user: current_user)
  end

  def unsubscribed
    s = Subscription.find_by(group_id: params[:group_id], user: current_user)
    if s.present?
      Subscription.destroy(s.id)
    end
  end

  def create_message data
    user = User.find data["current_user_id"].to_i

    if user == current_user
      Message.create!(
        body: data["message"],
        group_id: data["group_id"],
        user: user
      )
    end
  end

  def show_older_messages data
    MessagesBroadcastJob.perform_later(
      group_id:  data["group_id"],
      timestamp:  data["timestamp"],
      user_id:  data["current_user_id"]
    )
  end
end
