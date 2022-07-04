class ApplicationController < ActionController::API

    def get_user
        secret = Rails.application.secrets.secret_key_base. to_s
        
        header = request.headers['Authorization']
        if header 
            header = header.split(' ').last 
            decoded = JWT.decode(header, secret)[0]
            user_id = decoded['user_id']
            
            current_user = User.find(user_id)
            current_user[:password_digest] = nil
            return current_user
            
        end
    end

    def authorize_logged_in
        if !get_user() 
            render json: {'errors': 'Not authenticated'}, status: 401
        end
    end

    def authorize_admin
        if get_user[:role] != 'admin'
            render json: {'errors': 'Not authorized'}, status: 403
        end
    end

end
