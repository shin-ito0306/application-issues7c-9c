class GroupUsersController < ApplicationController
  def create
    @group = Group.find_by(id: params[:group_id])
    if !@group.users.include?(current_user)
     @group.users << current_user
    end
    redirect_to groups_path
  end
  
  def destroy
    @group_user = GroupUser.find_by(user_id: current_user.id, group_id: params[:id] )
    @group_user.destroy
    redirect_to groups_path
  end
end
