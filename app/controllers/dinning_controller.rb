class DinningController < ApplicationController 
    def index
    end
    
    def today
    end

    def frequest
        @user = current_user
    end
  
end