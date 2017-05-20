# DB設計


## users table

|Column   |Type      |Option |
|:--------|:------|:----------|
|name     |string |index: true, nill: false, unique: true|
|email    |string |nill: false, unique: true|
|password |string |nill: false|

### Association

- has_many :messages
- has_many :groups, through: :group_users
- has_many :group_users



## groups table

|Column   |Type      |Option |
|:--------|:------|:----------|
|name     |string |index: true, nill: false|

### Association
- has_many :messages
- has_many :users, through: :group_users
- has_many :group_users
- accepts_nested_attributes_for :group_users


## group_users table

|Column   |Type      |Option |
|:--------|:------|:----------|
|user_id  |integer|nill: false, foreign_key: true|
|group_id |integer|nill: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## messages table

|Column   |Type      |Option |
|:--------|:------|:----------|
|body     |text   |nill: false|
|image    |string | -         |
|user_id  |integer|nill: false, foreign_key: true|
|group_id |integer|nill: false, foreign_key: true|


### Association

- belongs_to :group
- belongs_to :user


