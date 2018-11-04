class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable
	belongs_to :role

	has_many :contributors
	has_many :projects, through: :contributors


	def manager?
	 self.role.name == "Manager"
	end

	def developer?
		self.role.name =="Developer"
	end
end
