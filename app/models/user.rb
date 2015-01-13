class User < ActiveRecord::Base
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
