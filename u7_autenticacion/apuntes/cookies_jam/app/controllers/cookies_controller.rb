class CookiesController < ApplicationController
  def set #seteando variable de sesion
    session[:current_user] = {
      test_id: {
        name: 'CookieJammer',
        client_id: '123456'
      }
    }
    cookies[:session_id] = 'test_id'
  end

  def show
    current_user = session[:current_user][cookies[:session_id]]
    @user_alias = current_user[:name.to_s]
    @client_id = current_user[:client_id.to_s]
  end

  def delete
    session.delete :user_alias
    session.delete :client_id
  end
end
