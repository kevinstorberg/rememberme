class PicturesController < ApplicationController
   def index
      @pictures = Picture.all
   end

   def new
      @picture = Picture.new
   end

   def create
      @picture = Picture.create(picture_params)
      redirect_to :back 
   end

   private
      def picture_params
         params.require(:picture).permit(:image)
      end
end
