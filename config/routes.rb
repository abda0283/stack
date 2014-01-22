Stack::Application.routes.draw do

# urls for active admin ( it put itself in )
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
		#Routes files matches the URLS up with our controller

		# I want to add in all the REST urls for 
		#the stories
		# e.g. index, show, new, create
		# edit, update , destory
		resources :stories do

		# this is called a nested resource
		# meaning the urls for commments are on the urls for stories

		resources :comments 

		# becuase votes are related to stories, jus like comments

		resources :votes

	end 

#lets add in a homepage

	root  "stories#index"

end
