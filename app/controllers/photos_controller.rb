class PhotosController < ApplicationController

    def index

      matching_photos = Photo.all
      @list_of_photos = matching_photos.order({ :created_at => :desc})
      render({ :template => "photo_templates/index" })


    end

    def show
    
    url_photo = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_photo })

    @the_photo = matching_photos.first

    render({ :template => "photo_templates/show"})

    end

    def delete

      the_id = params.fetch("path_id")

      matching_photos = Photo.where({ :id => the_id })

      delete_photo = matching_photos.first

      delete_photo.destroy

      redirect_to("/photos")

    end

    def create
      #Parameters: 	{"input_image"=>"a", "input_caption"=>"b", "input_owner_id"=>"c", "controller"=>"photos", "action"=>"create"}
      
      input_image = params.fetch("input_image")
      input_caption = params.fetch("input_caption")
      input_owner_id = params.fetch("input_owner_id")
      
      a_new_photo = Photo.new

      a_new_photo.image = input_image
      a_new_photo.caption = input_caption
      a_new_photo.owner_id = input_owner_id

      a_new_photo.save
      
      redirect_to("/photos/" + a_new_photo.id.to_s)

      #render({ :template => "photo_templates/create"})

    end

      def update

      
      the_id = params.fetch("modify_id")

      matching_photos = Photo.where({ :id => the_id})

      the_photo = matching_photos.first 
      
      input_image = params.fetch("input_image")
      input_caption = params.fetch("input_caption")

      the_photo.image = input_image
      the_photo.caption = input_caption

      the_photo.save


      
      redirect_to("/photos/" + the_photo.id.to_s)



      end

      def comment

        #name="input_photo_id" name="input_author_id name="input_comment">
        input_photo_id = params.fetch("input_photo_id")
        input_author_id = params.fetch("input_author_id")
        input_comment = params.fetch("input_comment")
        
        @input_photo_id = input_photo_id
        @a_new_comment = Comment.new
  
        @a_new_comment.photo_id = input_photo_id
        @a_new_comment.author_id = input_author_id
        @a_new_comment.body = input_comment
  
        @a_new_comment.save
        
        if input_photo_id == nil
          redirect_to("/404")

        else
          redirect_to("/photos/" + input_photo_id.to_s)

        end
        


      end



end
