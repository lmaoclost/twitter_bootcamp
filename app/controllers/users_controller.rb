class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @followers = Relationship.find(params[:follower_id])
    end
end
