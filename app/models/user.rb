class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: { allow_blank: false,
  message: "no puede estar en blanco" }

  validates :password, presence: { allow_blank: false,
  message: "no puede estar en blanco" }
  
  validates :password_confirmation, presence: { allow_blank: false,
  message: "no puede estar en blanco"}
  
  # validates :password, confirmation: true,  presence: { :on => :create,
  #   message: "no puede estar en blanco" }





  
end
