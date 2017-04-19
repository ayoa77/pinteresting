class SessionsController < ApplicationController
    def new; end

    def create
        if params[:provider].present?
            user = User.from_omniauth(env['omniauth.auth'])
            session[:user_id] = user.id
            #   I think there may be an issue with the redirect here
            respond_to do |format|
              format.html {redirect_to user}
              format.js {render :action => 'facebook.coffee'}
              format.json
            end

        else
            user = User.find_by(email: params[:sessions][:email])
            if user && user.authenticate(params[:sessions][:password])
                session[:user_id] = user.id
                redirect_to user, notice: 'logged in!'
            else
                flash.now.alert = 'Email or password is invalid'
                render 'new'
            end
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: 'logged out!'
    end
  end
