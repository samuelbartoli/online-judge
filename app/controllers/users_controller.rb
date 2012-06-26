class UsersController < ApplicationController 

  # GET /
  def root
      respond_to do |format|
        format.html # root.html.erb
      end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:root, :notice => 'Registration successfull.')}
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render action: "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end

