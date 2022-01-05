class AdminController < ApplicationController
    layout"admin"
    def login
    end
    def admindashboard
        @user = User.find(session[:user_id])
        @alluser = User.all
    end
    def adminprofile
        @user = User.find(session[:user_id])
        @alluser = User.all
    end
    def editadminprofile
        @user = User.find(session[:user_id])
    end
    def adminsettings
        @user = User.find(session[:user_id])
    end
    def userslist
        
        @alluser = User.all
        @user = User.find(session[:user_id])
    end
    def update
        user = User.find(session[:user_id])
        if user.update(user_params)
            redirect_to '/admindashboard'
        else
            flash[:login_errors] = ['invalid credentials']
            redirect_to '/admindashboard'
        end
    end

    def create
        user = User.find_by(email:login_params[:email])
        if user && user.authenticate(login_params[:password])
            if user.isadmin
                session[:user_id] = user.id
                redirect_to '/admindashboard'
            else
                session[:user_id] = user.id
                redirect_to '/dashboard'
            end
        else
            redirect_to '/admin', alert: "invlid credentials"
            flash[:login_errors] = ['invalid credentials']
            flash.now[:alert] = 'User not found!'
            
            # flash[:alert] = "User not found."
            # redirect_to '/'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email,  :phone, :profession, :image)

        end

    private
        def login_params
            params.require(:login).permit(:email, :password)
        end
end
