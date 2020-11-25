class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name

  has_many :carts

  has_many :orders

  has_one_attached :avatar

  after_create :welcome_send

  def welcome_send
    puts " ==== WELCOME SEND METHOD STARTING === "
    UserMailer.welcome_email(self).deliver_now
  end

end
