$(function() {
  function buildHTML(data) {
    var listItem = $('<li class="chat-main__body--message">');
    listItem.append($("<div class='chat-main__body--message-name'>" + data.name + "</div>"));
    listItem.append($("<div class='chat-main__body--message-time'>" + data.created_at + "</div>"));
    listItem.append($("<div class='chat-main__body--message-body'>" + data.body + "</div>"));
    return listItem
  }

  $('#js-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: location.href,
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
    })
    .done(function(data) {
      $('.chat-main__body').append(buildHTML(data));
      $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight}, 0);
      $('.chat-main__footer-form').val('');
    })
    .fail(function() {
      alert('失敗しました。');
    });
  });
});
