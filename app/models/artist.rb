class Artist < ActiveRecord::Base
	has_and_belongs_to_many :events
	has_and_belongs_to_many :arts
	validates :name,  presence: true, uniqueness: {case_sensitive: false}
end
