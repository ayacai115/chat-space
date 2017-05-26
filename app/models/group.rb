class Group < ApplicationRecord
  has_many :messages
  has_many :members
  has_many :users, through: :members
  validates :name, presence: true
  validate :add_error_sample

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if name.empty?
      errors.add(:name, "に関係するエラーを追加")
    end
  end
end
