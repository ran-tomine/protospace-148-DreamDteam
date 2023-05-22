class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  def edit
    @prototype = Prototype.find(params[:id])
    move_to_index unless user_signed_in? && current_user.id == @prototype.user_id
  end

  def update
    @prototype = Prototype.find(params[:id])
  
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end
    

  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
<<<<<<< Updated upstream
    unless user_signed_in?
=======
    #unless user_signed_in? && current_user.id == @prototype.user_id
>>>>>>> Stashed changes
      redirect_to action: :index
    #end
  end
  
end
