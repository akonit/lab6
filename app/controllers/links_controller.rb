class LinksController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin"

	def new
		@link = Link.new
    end

    def create
    	@link = Link.new(link_params)
 
        if @link.save
            redirect_to links_path
	    else
	        render 'new'
	    end
    end

    def index
	    @links = Link.all
	end

	def destroy
	  	@link = Link.find(params[:id])
	  	@link.destroy
	 
	  	redirect_to links_path
	end

    private
	    def link_params
	        params.require(:link).permit(:product_id, :category_id)
	    end
end
