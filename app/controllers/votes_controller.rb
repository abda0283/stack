class VotesController < ApplicationController


# just create a vote

# no neeed for a new.html.erb because it doesnt make much sense

	def create


		# again, because we're in the votes controller
		# the story id is found by params[:story_id]

		@story = Story.find(params[:story_id])



		# create instead of new beauce we dont need to worry about validations

		@vote = @story.votes.create

		flash[:success] = "you've voted"


		# redirect_to story_path(@story)


		if params[:back_to] == "home"
			# go to the homepage

			redirect_to root_path

		else

			redirect_to story_path(@story)
		end



	end



end
