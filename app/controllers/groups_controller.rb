class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
end
