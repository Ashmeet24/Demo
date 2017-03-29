class LikesController < ApplicationController
  def index
		@user = User.find(params[:user_id])
		@likes=@user.likes.all 
			render json: {:like => @likes, response: 200, responsemsg: "success"}
	end
  def create
		user = User.find(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end

		user_events = user.likes.build(like_params) 
		if user_events.save
			render json: {response: 500,msg: "Liked", like: user_events}
		else
			render json: {response: 500,msg: "Not Liked"}
		end
	end
  private 

def like_params
			params.require(:like).permit(:user_id, :likable_id, :likable_type, :status)

end
end
