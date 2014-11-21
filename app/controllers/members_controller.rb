class MembersController < ApplicationController

  def index
    @users = User.all
    if params[:group_id]
      @users = Group.find(params[:group_id]).users
    elsif params[:term]
      @users = @users.where("email like ?", "%#{params[:term]}%")
    end
  end

  def create
    email = params[:email]
    @user = User.find_by_email(email.downcase) || User.new(email: params[:email])
    if @user.new_record?
      @user.invite!
    end
    respond_to do |format|
      if @user.memberships.create(group_id: params[:group_id])
        format.json { render json: @user }
      else
        format.json { render json: @exchange.errors }
      end
    end
  end

end
