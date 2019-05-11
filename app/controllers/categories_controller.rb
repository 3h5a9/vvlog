class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(cat_params)
    if @category.save
      flash[:success] = "Category created successfully."
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(cat_params)
      flash[:success] = "Category updated successfully."
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.delete
    flash[:danger] = "Category deleted successfully."
    redirect_to categories_path
  end


  private
  def set_category
    @category = Category.find(params[:id])
  end

  def cat_params
    params.require(:category).permit(:name, :description)
  end
end
