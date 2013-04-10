<<<<<<< HEAD
#encoding: utf-8 
=======
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles
  # attr_accessible :title, :body

  ROLES = %w[admin suporte]

  	def roles=(roles)
  		self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
	end

	def roles
  		ROLES.reject do |r|
    		((roles_mask || 0) & 2**ROLES.index(r)).zero?
  		end
	end
	def is?(role)
  		roles.include?(role.to_s)
	end
end
