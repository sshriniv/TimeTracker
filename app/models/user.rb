class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    belongs_to :company

	has_many :works
	has_many :projects, :through => :works

	validates :fname, presence: true
	validates :lname, presence: true
	validates :company, presence: true

	def to_s
      "#{fname} #{lname}"
	end
end
