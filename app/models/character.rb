class Character < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 140}
  validates :user_id, presence: true

  default_scope order: 'characters.created_at DESC'
end
