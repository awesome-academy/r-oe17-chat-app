const scroll_bottom = function() {
  if ($("#timeline").length > 0) {
    $("#timeline").scrollTop($("#timeline")[0].scrollHeight);
  }
};

const submit_message = function() {
  $("#message_body").on("keydown", e => {
    if (e.keyCode == 13) {
      $("#button-addon2").click();
      e.target.value = "";
    }
  });
};

export { scroll_bottom, submit_message };
