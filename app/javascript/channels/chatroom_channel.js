import consumer from "./consumer";
import { scroll_bottom } from "../packs/utils";

const group_id = document.location.pathname.split("/").pop();

const group = consumer.subscriptions.create(
  { channel: "ChatroomChannel", group_id: group_id },
  {
    connected() {},
    disconnected() {},
    received(data) {
      console.log(data);
      if (data["message"]) {
        $("#timeline").append(data["message"]);
      } else if (data["messages"]) {
        $("#timeline").prepend(data["messages"]);
      }
      scroll_bottom();
    },
    create_message(data) {
      return this.perform("create_message", data);
    },
    show_older_messages(data) {
      return this.perform("show_older_messages", data);
    }
  }
);

$(document).on("keydown", "input[id=js-room-new-message]", function(event) {
  let current_user_id;
  if (!event.shiftKey && event.keyCode === 13 && event.target.value) {
    current_user_id = $("meta[name=current-user]").attr("id");
    group.create_message({
      group_id: group_id,
      current_user_id: current_user_id,
      message: event.target.value
    });
    event.target.value = "";
    event.preventDefault();
    return event.stopPropagation();
  }
});

$(document).on("click", "a[id=js-room-show-more]", function(event) {
  let current_user_id;
  $(event.target).hide(0);
  current_user_id = $("meta[name=current-user]").attr("id");
  group.show_older_messages({
    group_id: group_id,
    current_user_id: current_user_id,
    timestamp: $(this).data("timestamp")
  });
  return event.preventDefault();
});
