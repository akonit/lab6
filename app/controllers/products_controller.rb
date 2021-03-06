class ProductsController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

	def new
		@product = Product.new
    end

    def create
    	@product = Product.new(product_params)
 
        if @product.save
            redirect_to @product
	    else
	        render 'new'
	    end
    end

    def show
	    @product = Product.find(params[:id])
	    @rating = Rating.where(product_id: @product.id, score: 0).first
	    if @rating == nil
	    	@rating = Rating.create(product_id: @product.id, score: 0)
	    end
	end

	def index
	    if params[:search]
      	    @products = Product.search(params[:search])
    	else
      		@products = Product.all
    	end
	end

	def edit
	    @product = Product.find(params[:id])
	end

	def update
	    @product = Product.find(params[:id])
	 
	    if @product.update(product_params)
	        redirect_to @product
	    else
	        render 'edit'
	    end
	end

	def destroy
	  	@product = Product.find(params[:id])
	  	@product.destroy
	 
	  	redirect_to products_path
	end

    private
	    def product_params
	        params.require(:product).permit(:name, :description)
	    end
end
