class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :username, presence: true, uniqueness: true
  enum role: ["default", "admin"]

  def self.user_with_most_orders
    order("orders_count DESC").limit(1).first.name
  end

end
