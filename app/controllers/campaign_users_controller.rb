class CampaignUsersController < ApplicationController
  def create
    CampaignUser.create(campaign_id: params[:format], user_id: current_user.id, user_type: "Supporter")
  	render nothing: true
  end
end