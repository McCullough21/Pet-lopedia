class SessionsController < ApplicationController

    def new
        
     
       if
        
         @user = User.find_by(email: auth['info']['email']) 
           
          
          session[:id] = @user.id
          redirect_to user_path(@user)
          
          
         
        else 
         @user = User.new(uid: auth['uid'], username: auth['info']['email'].split(/\@/).first, password: SecureRandom.hex, email: auth['info']['email'])
         
            if @user.save
                
            session[:id] = @user.id 
            end
        end
       
      end

      
     
      private

      
     
      def auth
        request.env['omniauth.auth']
      end
    
end
