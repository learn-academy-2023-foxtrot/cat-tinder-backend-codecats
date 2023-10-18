class CatsController < ApplicationController

    def index
        cats = Cat.all
        render json: cats
    end

    def create
        cat = Cat.create(cat_params)
        if cat.valid?
            render json: cat
        end
    end
    
    def update
    cat = Cat.find(params[:id])
    cat.update(cat_params)
    if cat.valid?
      render json: cat
    else
      render json: { errors: cat.errors.full_messages }, status: 422
    end
  end
      
  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    head :no_content
  end
   private
    def cat_params
        params.require(:cat).permit(:name, :age, :hobbies, :image)
    end
end
