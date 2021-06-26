class GroupsController < ApplicationController
  def post_message
    authorization_object = Authorization.new(request)
    current_user = authorization_object.current_user
    if current_user == Group.find(params[:id]).created_by
      # post message
    else
      # respond: You are not allowed to post to this group
    end
  end
end