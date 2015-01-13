class Work < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	validates :hours, numericality: {only_integer: true, greater_than: 0}
	validates :datetimeperformed, presence: true
	#validates :date_not_more_than_1month

	scope :fullday, -> {where("hours >= 8")}

	#def date_not_more_than_1month
		#if datetimeperformed.present? && datetimeperformed > (DateTime.now + 1.month)	
			#errors.add(:datetimeperformed, "Date cannot be more than 1 month ahead")
        #end
	#end

	def self.recentdays(numdaysago)
        since_date = Time.now - numdaysago.to_i.days
        where("datetimeperformed > '#{since_date}'")
	end
end
