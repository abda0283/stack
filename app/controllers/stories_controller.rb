class StoriesController < ApplicationController

	#  before we run the show , edit , update and destroy
	# lets find the story we're talkling about 

	before_action :find_story, only:[:show,:edit,:update,:destroy]




	#controllers manage the urls,
	#the data from the models, and our html views

	def index
		@username = "Timothy"
		@now = Time.now

		#@stories = ["google","facebook", "twitter", "linkedin" , "Andy"]


		#set the variable stories
		#to all the records in our story database table

		# @stories = Story.order("created_at desc")

		# @stories = Story.order("votes_count desc, title asc")

		#  if it has ?sort=recent in the url
		# sort by created at
		# if it has nothing, then do the popular ones

		if params[:sort] == "recent"	
			# sort by created at, 


			@stories = Story.order("created_at desc")

		elsif params[:sort]=="featured"

			# sort by featured

			@stories = Story.where(is_featured: true)
							.order("is_featured desc, title asc")
				

		else

			@stories = Story.order("votes_count desc, title asc")
			# sort by popular
		end

		# add in my pagination

		# overwrite the @stories variable with a paginated version

		@stories = @stories.page(params[:page]).per(3)

	end


		# this is the individual story page
	# parms id is the number in the url
	def show
		# @story = Story.find( params[:id] )

	end

	# form for new story

	def new 

	#variables @story goes to the view
	#story.new comes from the model
	 @story = Story.new


	end
	#this is where the form data from new.html.erb view goes

	def create 
		@story = Story.new(story_params)

			# conditional ... if 
			if @story.save

					# lets add a flash of connet to the tell the user we've added this
					flash[:success] = "you've added a link booyaa"




					# go back to the home page 
					redirect_to root_path

			else 

					render "new"

			end

	end

# show the edit form

def edit 

	# @story = Story.find(params[:id])


end

# actually update the database

def update

	# @story = Story.find(params[:id])

	if @story.update(story_params)

		flash[:success] = "All good , all updated"

		redirect_to story_path(@story)
		
		else

			render "edit"

	end

end

# actually destroy the record in the database

def destroy
	@story = Story.find(params[:id])


	@story.destroy

	flash[:success] = "Deleted "

	redirect_to root_path


end



	# shortcut for getting form data
	def story_params

		params.require( :story).permit(:title, :description, :url, :tag_list) 

	end 

	# Shortcut for finding the story from the url

	def find_story

		@story = Story.find(params[:id])




	end



end
