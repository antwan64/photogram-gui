class PhotosController < ApplicationController

    def index

      matching_photos = Photo.all
      @list_of_photos = matching_photos.order({ :created_at => :desc})
      render({ :template => "photo_templates/index" })


    end

    def show
    
    url_photos = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    render({ :template => "user_templates/show"})

    
    
    end






end
