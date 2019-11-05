class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      @users = User.all
      @sheet = User.pluck('id', 'name', 'foodreq')
      respond_to do |format|
      format.html
      format.csv {send_data @sheet.to_csv}
      format.xls #{send_data @sheet.to_csv(col_sep: "\t") }
       end
  end

  def show    
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase
    @user.name = @user.name.downcase
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, success: 'Usuario creado extitosamente' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to new_user_path, danger: 'Email o contraseña inválidos'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def before_save
    self.email.downcase!
    end

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

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, info: 'Usuario eliminado' }
      format.json { head :no_content }
    end
  end


  def passwordchange
     @user = current_user
  end


  private
    def set_user 
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :foodreq, :name)
    end

    
end
