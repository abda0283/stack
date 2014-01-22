class Story < ActiveRecord::Base

# this is a connection in rails
# our stroy has manuy comments

has_many :comments 
has_many :votes

# setup as acts as taggable
acts_as_taggable


# validation rules.....
validates :title, length:{ minimum: 5 }
validates :description, presence: true
validates :url, presence: true, uniqueness: {message: "Has already been added"}


# I want to overwrite the url stucture in activerecord
# activerecord is the rails way to manage models
# to_params is the method we want to overwrite
# I want my title to be something like 7-designer-new
# this is my ID then my title as a url


	def to_param


		 "#{id}-#{title.parameterize}"


	end

	# this is my shortcut to make nice clean urls for our users

	def nice_url

		# i want to take url
		# and i want to remove http://
		# and i want to remove www.
		# gsub is a global substitution  
		url.gsub("http://","").gsub("www.","")
	end

end
