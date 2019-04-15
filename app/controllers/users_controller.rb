class UsersController < ApplicationController
  def new
  	@user = User.new
  	@roles = Role.nonhidden
  end

  def index
  	if params[:q] && params[:q][:role_ids_cont_any]
  		users = User.where(id: User.all.collect{|a| a.id if params[:q][:role_ids_cont_any].any? {|word| a.role_names.split(', ').include?(word)}}.compact)
  		params[:q].delete("role_ids_cont_any")
  	else
  		puts "sfsdfs ===="
  		users = User.all
  	end
		@q = users.ransack(params[:q])
  	@users = @q.result(distinct: true).page params[:page]
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_new_path, flash: {success: "Successfully create user with email: #{@user.email}"}
  	else
  		redirect_to users_new_path, flash: {danger: "Failed to create user due to: #{@user.errors.full_messages.join(',')}"}
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :avatar, :role_ids => [], user_meta_attributes: [:id, :meta_key, :meta_value, :_destroy])
  end
end
