module Authenticable

  # Devise methods overwrites

  # method for finding the currently "logged in" beekeeper via authentication token
  def current_center
    auth_header = request.headers['Authorization']
    if auth_header
      temp = auth_header.split
      if temp.size == 2
        current_token ||= Token.find_by(auth_token: temp[1])
        if current_token
          @current_center ||= Center.find_by(id: current_token.center_id)
        end
      else
        current_token ||= Token.find_by(auth_token: temp[0])
        if current_token
          @current_center ||= Center.find_by(id: current_token.center_id)
        end
      end
    end
  end

  def current_admin
    auth_header = request.headers['Authorization']
    if auth_header
      temp = auth_header.split
      if temp.size == 2
        current_token ||= Token.find_by(auth_token: temp[1])
        if current_token
          @current_admin ||= Admin.find_by(id: current_token.admin_id)
        end
      else
        current_token ||= Token.find_by(auth_token: temp[0])
        if current_token
          @current_admin ||= Admin.find_by(id: current_token.admin_id)
        end
      end
    end
  end



  # method for authenticating either a farmer or a beekeeper
  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
           status: :unauthorized unless current_center.present?
  end

  def authenticate_with_token_admin!
    render json: { errors: "Not authenticated" },
           status: :unauthorized unless current_admin.present?
  end
end