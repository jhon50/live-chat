import consumer from "./consumer"

const DOM = $(document);

DOM.on('turbolinks:load', () => {
  const available_rooms = load_rooms();
  const container = $('#messages')

  let current_room = available_rooms[0];
  let subscription = init_subscription(current_room, container);

  $('.available-room').on('click', function() {
    current_room = $(this).data('id');
    console.log('current_room: ' + current_room)
    consumer.disconnect();
    consumer.subscriptions.remove(subscription)
    subscription = init_subscription(current_room, container);
  })
});

const init_subscription = (room, container) => {
  return consumer.subscriptions.create({ channel: "ChatChannel", room_id: room }, {
    connected() {
      console.log(`Connected to the server. (Chat Channel ${room})`)
      console.log("Fetching messages.")

      fetch_messages(room, container);
      set_message_input_room(room);
    },

    disconnected() {
      console.log(`Disconnected from the server. (Chat Channel ${room})`)
    },

    received(data) {
      container.html(container.html() + data.html)

      scroll_messages(container)

      $("input[type=submit]").attr('disabled', false)
      $('#message_content').val('')
    }
  });
}

const fetch_messages = (room, container) => {
  $.ajax({
    method: "GET",
    url: "/messages",
    data: { room_id: room }
  })
  .done((msg) => {
    container.html(msg)
    scroll_messages(container);
  });
}

const load_rooms = () => {
  return $('#available_rooms').data('available-rooms');
}

const set_message_input_room = (room) => {
  $('#message_room_id').val(room);
}

const scroll_messages = (container) => {
  const div = container[0];
  div.scrollTop = div.scrollHeight;
}
