class Event < ActiveRecord::Base
	has_and_belongs_to_many :arts
	has_and_belongs_to_many :artists
	has_attached_file :poster, :styles => { :home => "350x1000>", :thumb => "150x150#" }
	validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
end
