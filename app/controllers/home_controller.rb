class HomeController < ApplicationController
    layout"user"
    def index
        @user = User.find(session[:user_id])
        @pages = Userpage.where(userid: session[:user_id])
    end

    def edit
       
        @user = User.find(session[:user_id])
        @pages = Userpage.where(userid: session[:user_id])
    end

    def admin
        @alluser = User.all
        @user = User.find(session[:user_id])
    end

    def createpage
       @userid=session[:user_id] 
    end

    def pagedata
        @pages=Userpage.where(id: params[:pageid]) 
        @subpages=Subpage.where(pageid: params[:pageid])
     end

     def subpagedata
        @pages=Subpage.where(id: params[:pageid]) 
     end

    def seo
        @pages = Userpage.where(userid: session[:user_id])
    end

    def listpage
        @pages = Userpage.where(userid: session[:user_id])
        
    end

    def subpage
        @pages=Userpage.where(id: params[:pageid]) 
    end

    def create
        page = Userpage.new(page_params)
        if page.save
            
            redirect_to '/listpage'
        else
            flash[:register_errors] = user.errors.full_messages
            redirect_to '/'
        end
        # user = User.create!(user_params)
        # session[:user_id] = user.id
        # redirect_to '/dashboard'
    end


    def createsubpage
        page = Subpage.new(subpage_params)
        if page.save
            
            redirect_to '/listpage'
        else
            flash[:register_errors] = user.errors.full_messages
            redirect_to '/'
        end
        # user = User.create!(user_params)
        # session[:user_id] = user.id
        # redirect_to '/dashboard'
    end

    def updatepage
        page = Userpage.find(params[:pageid])
        if page.update(page_params)
            redirect_to '/listpage'
        else
            flash[:login_errors] = ['invalid credentials']
            redirect_to '/dashboard'
        end
    end

    def deletepage
        page = Userpage.find(params[:pageid])
        page.destroy
        redirect_to '/listpage'
        
    end


    def updatesubpage
        page = Subpage.find(params[:subpageid])
        if page.update(page_params)
            redirect_to '/listpage'
        else
            flash[:login_errors] = ['invalid credentials']
            redirect_to '/dashboard'
        end
    end

    private
        def page_params
            params.require(:page).permit(:userid, :title, :pagetitle, :keywords, :metadescription, :description, :image)

        end
    
    private
        def subpage_params
            params.require(:page).permit(:pageid, :title, :pagetitle, :keywords, :metadescription, :description, :image)

        end
end
