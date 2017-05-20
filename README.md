# chat-space データベース設計(仮、5/20)

EXPERT12期の大木です。
以下にchat-spaceデータベース設計案を記述します。
ご確認よろしくお願いいたします。


## モデル

### Userモデル

|カラム名   |型      |オプション |
|:--------|:------|:----------|
|id       |integer|主キー制約(自動)|
|name     |string |NOT NULL制約、UNIQUE制約、インデックス|
|email    |string |NOT NULL制約、UNIQUE制約|
|password |string |NOT NULL制約|


### Groupモデル

|カラム名   |型      |オプション |
|:--------|:------|:----------|
|id       |integer|主キー制約(自動)|
|name     |string |NOT NULL制約、インデックス|
※グループは、名前(name)が重複していても作れる。


### GroupUserモデル(中間テーブル)

|カラム名   |型      |オプション |
|:--------|:------|:----------|
|id       |integer|主キー制約(自動)|
|user_id  |integer|NOT NULL制約、外部キー制約|
|group_id |integer|NOT NULL制約、外部キー制約|



### Messageモデル

|カラム名   |型      |オプション |
|:--------|:------|:----------|
|id       |integer|主キー制約(自動)|
|body     |text   |NOT NULL制約|
|image    |string | -         |
|user_id  |integer|NOT NULL制約、外部キー制約|
|group_id |integer|NOT NULL制約、外部キー制約|




## アソシエーション

### Userモデル

```ruby:user.rb
class User < ApplicationRecord
  has_many :messages
  has_many :groups, through: :group_users
  has_many :group_users
end

```

### Groupモデル

```ruby:group.rb
class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :group_users # groupを保存するのと同時にgroup_usersを更新する
end
```

### GroupUserモデル(中間テーブル)

``` ruby:group_users.rb
class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
```

### Messageモデル

``` ruby:messages.rb
class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
```


