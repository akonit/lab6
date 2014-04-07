class OpinionsController < ApplicationController

	def create
	    @product = Product.find(params[:product_id])
	    @opinion = @product.opinions.create(opinion_params)
	    redirect_to product_path(@product)
	end
	 
	private
	    def opinion_params
	        params.require(:opinion).permit(:text, :login)
	end
end
