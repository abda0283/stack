require 'obscenity/active_model'


class Comment < ActiveRecord::Base


	# a comment belongs to a story
	
	# this is our opposite assiocation

	belongs_to :story


	# validations

	validates :body, length: {minimum: 20}, obscenity: {sanitize: true, replacement: :vowels}



end
