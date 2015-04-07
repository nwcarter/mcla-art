class Art < ActiveRecord::Base
	has_and_belongs_to_many :events
	has_and_belongs_to_many :artists
	has_attached_file :image, :styles => { :large => "600x600>", :thumb => "200x200#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
