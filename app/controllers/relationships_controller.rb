class RelationshipsController < ApplicationController
    def create
        @user = User.find(params[:id])

        if current_user.following? @user
            redirect_to user_path(@user), alert: "#{@user.email} já está sendo seguido"
        else
            current_user.follow! @user
            redirect_to user_path(@user), notice: "#{@user.email} seguido com sucesso"
        end
    end
    
    def destroy
        @user = User.find(params[:id])

        current_user.unfollow! @user
        redirect_to user_path(@user), notice: "#{@user.email} deixou de ser seguido"
    end
end
