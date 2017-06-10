$(function() {
  var resultList = $("#user-search-result");

  function buildHTML(data) {
    var listItem = $("<li class='chat-group-user clearfix'>");
    listItem.append($("<p class='chat-group-user__name'>" + data.name + "</p>"))
    listItem.append($("<a class='user-search-add chat-group-user__btn chat-group-user__btn--add' data-user-id=" + data.id + " data-user-name=" + data.name + ">追加</a>"));
    return listItem;
  }

  var membersList = $("#chat-group-users");

  function buildUserHTML(userName, userId) {
    var listItem = $("<li class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>")
    listItem.append($("<input name='group[user_ids][]' type='hidden' value=" + userId + ">"));
    listItem.append($("<p class='chat-group-user__name'>" + userName + "</p>"));
    listItem.append($("<a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>"));
    return listItem;
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: ("q=" + input),
      dataType: 'json',
      contentType: false,
      processData: false,
    })
    .done(function(data) {
      data.forEach(function(value, index){
        var html = buildHTML(data[index]);
        resultList.append(html);
        });
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました。');
    });
  });

  $("#user-search-result").on("click", ".user-search-add", function() {
    var $this = $(this);
    var userName = $this.attr("data-user-name");
    var userId = $this.attr("data-user-id");
    var userHTML = buildUserHTML(userName, userId);
    membersList.append(userHTML);
    $this.parent().remove();
  });

  $(".chat-group-form__field").on("click", ".user-search-remove", function() {
    $(this).parent().remove();
  });
});
