class Store < ActiveRecord::Base
  belongs_to :user
  validates :store_name, :c_card, :e_money, presence: true
  validates :store_name, uniqueness: true
end
