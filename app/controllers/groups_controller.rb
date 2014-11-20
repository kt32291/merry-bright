class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
    if params[:term]
      @groups = @groups.where("name like ?", "%#{params[:term]}%")
    end
  end

end
