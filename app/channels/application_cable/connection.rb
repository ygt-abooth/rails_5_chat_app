module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email #used to display debugging information in the console
    end

    protected

    def find_verified_user #this checks whether a user is authenticated with devise
      if verified_user = env['warden'].user #under the hood, devise uses Warden for authentication. env['warden'].user tries to fetch currently logged in user
        verified_user
      else
        reject_unauthorized_connection #ActionCable method that just raises an error 
      end
    end

  end
end
