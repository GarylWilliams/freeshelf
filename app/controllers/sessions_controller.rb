class SessionsController < ApplicationController

    def new
     
    end
    
    def create
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password]) 
          session[:user_id] = @user.id
          
          puts "where the hell is it going"
        redirect_to '/books'
      else
        redirect_to '/login'
      end 
     end
    def destroy 
	  session[:user_id] = nil 
	  redirect_to root_path 
	end
    
end
