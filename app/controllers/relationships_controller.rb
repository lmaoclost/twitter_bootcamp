class RelationshipsController < ApplicationController
    def create
        @User = current_user.follow.new(current_user_params)

        if @User.save
            redirect_to root_path, notice: 'Following'
        else
            redirect_to root_path, alert: 'Erro'
        end
    end
    
    def destroy
        @User = current_user.follow.new(current_user_params)

        if @tweet.save
            redirect_to root_path, notice: 'Unfollowing'
        else
            redirect_to root_path, alert: 'Erro'
        end
    end
end
