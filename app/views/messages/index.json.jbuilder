json.array!(@group.messages) do |message|
  json.name message.user.name
  json.created_at message.created_at.strftime('%Y年%m月%d日 %H:%M:%S')
  json.body message.body
  json.image message.image
end
