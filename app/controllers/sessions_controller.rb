class SessionsController < ApplicationController

    def create
        
     
       if
         @user = User.find_by(email: auth['info']['email']) do |u|
           
          
          session[:id] = @user.id
          redirect_to user_path(@user)
          
          
         end
        else 
         @user = User.new(uid: auth['uid'], password: SecureRandom.hex, email: auth['info']['email'])
          
            if @user.save
                
            session[:id] = @user.id
            redirect_to user_path(@user)
            
            
            end
        end
       
      end
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
    
end
