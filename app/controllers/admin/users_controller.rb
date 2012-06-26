class Admin::UsersController < ApplicationController
  before_filter :admin_login_required

  # GET admin/users
  # GET admin/users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET admin/users/1
  # GET admin/users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { render "users/show" }
      format.json { render json: @user }
    end
  end

  # GET admin/users/1/edit
  def edit
    @user = User.find(params[:id])
    render "users/edit"
  end

  # PUT admin/users/1
  # PUT admin/users/1.json
  def update
    @user = User.find(params[:id])

    if params[:user][:roles]=="1" && @user.is_admin?
      @user.remove_role 'admin'
    elsif params[:user][:roles]=="1"
      print "asdasdasdasd"
      @user.add_role 'admin'
    end

    params[:user].delete("roles")

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to :admin_user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE admin/users/1
  # DELETE admin/users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to :admin_users }
      format.json { head :no_content }
    end
  end
  
end

