class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        # protect_from_forgery unless: -> { request.format.json? }
        # before_action :authenticate_user!
end
