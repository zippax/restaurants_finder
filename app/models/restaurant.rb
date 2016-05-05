class Restaurant < ActiveRecord::Base
	has_many :menus
	has_many :items

	has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  	# Search form
  	def self.search(search)
  		if search
  			Restaurant.where("name LIKE ? OR tags LIKE ?", "%#{search}%", "%#{search}%")
  		else
  			Restaurant.all
  		end
  	end
end
