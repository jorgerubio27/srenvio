class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # http_basic_authenticate_with name: "admin", password: "123"


  # GET /users
  # GET /users.json
  def index
      @users = User.all
      @sheet = User.pluck('id', 'name', 'foodreq')
      
      # @sheet = User.pluck(:name, :foodreq)

      respond_to do |format|
      format.html
      format.csv {send_data @sheet.to_csv}
      format.xls #{send_data @sheet.to_csv(col_sep: "\t") }

      
      # format.html
      # format.csv { send_data User.tux(@users), filename: "usuarios-#{Date.today}.csv" }
       end
  end

  







  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        
        format.html { redirect_to @user, success: 'Usuario creado extitosamente' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to new_user_path, danger: 'Email o contraseña inválidos'}
        # format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, success: 'Información enviada' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

    

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, info: 'Usuario eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user 
      @user = User.find(params[:id])
    end

    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :foodreq, :name)
    end

    
end
