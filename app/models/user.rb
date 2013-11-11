class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :author_ships
  has_many :newses, through: :author_ships
  has_many :subscriptions
  has_many :sections, through: :subscriptions
end
