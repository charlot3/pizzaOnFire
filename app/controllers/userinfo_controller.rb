class UserinfoController < ApplicationController
  def new
    @userinfo = Userinfo.select(:uid,:username,:useremail,:usertel)
  end
end
