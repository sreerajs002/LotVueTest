class RolesController < ApplicationController
  def index
  	@roles = Role.all
  end

  def new
  	@role = Role.new
  end

  def create
		@role = Role.new(role_params)
		if @role.save
			redirect_to roles_new_path, flash: {success: "successfully create role \"#{@role.name}\""}
  	else 
  		redirect_to roles_new_path, flash: {danger: "#{@role.errors.full_messages.join(',')}"}
  	end
  end

  def update_status
  	Role.update_all(hide_status: false)
  	@roles = Role.where(id: params["role"]["hide_status"].keys)
		if @roles.update(hide_status: true)
			redirect_to roles_new_path, flash: {success: "#{@roles.collect(&:name).join(',')} are successfully updated as hidden"}
  	else 
  		redirect_to roles_new_path, flash: {danger: "#{@role.errors.full_messages.join(',')}"}
  	end
  end

  private
  def role_params
  	params.require(:role).permit(:name,:hide_status)
  end
end
