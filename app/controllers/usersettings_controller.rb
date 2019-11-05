class UsersettingsController < ApplicationController
    def passwordchange
        @user = current_user
    end
end