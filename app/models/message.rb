class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255} # カラ禁止かつ255字以内
  validates :title, presence: true, length: { maximum: 255} # カラ禁止かつ255字以内
end