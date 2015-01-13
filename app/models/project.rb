class Project < ActiveRecord::Base
    belongs_to :company

	has_many :works
	has_many :users, :through => :works

    validates :name, presence: true

	scope :lowdefaultrate, -> {where("default_rate < 60")}

	def to_s
		"#{name} (#{company})"
	end
end
