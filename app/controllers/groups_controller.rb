class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @group.users << current_user
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
end
