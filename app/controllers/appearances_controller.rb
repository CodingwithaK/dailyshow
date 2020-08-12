class AppearancesController < ApplicationController
    def new
        @appearance = Appearance.new
    end
    def create 
        
        @appearance = Appearance.create(appearance_params)
        if @appearance.valid?
            @appearance.save
            redirect_to episode_path(@appearance.episode_id)
        else
            render :new
        end
    end
    private
    def appearance_params
        params.require(:appearance).permit(:rating,:episode_id,:guest_id)
    end

end
