class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  enum user_type: {manager:0, developer:1, qa:2}
  has_many :projects ,dependent: :nullify
  has_many :bugs,dependent: :nullify
end
