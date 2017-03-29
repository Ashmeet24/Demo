	class UsersController < ApplicationController
def index
    @user=User.all
    render json: {:user => @user}
end
def edit
    @user=User.find(params[:id])
    end

def new
@user = User.new
end

def create
  user = User.new(user_params)
  if user.save!
     session[:user_id] = user.id
    render json: {:user => user,response: 200, responsemsg: "User Created"}
  else
    render json: {:user => "response code: 400, response message: Bad Request"}
    end
end


 def show
    @user = User.find(params[:id])
    render json: {:user => @user}
  end
def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to @user
  else
    #render 'edit'
    render json: {:user => "User not found"}
  end
end



def create_post
   user = User.find(params[:id])
   return
  if user
     user_posts = user.posts.build(post_params)

  else
    render json: {responsecode: 500, responsemsg: "User does not exist"}
  end
end

def destroy
        user = User.find(params[:id])
        if user.present?
             user.destroy
               render json: {:user => "registration code: 200,response message: destroy Successfull",code:200}
        else
              render json: {:user => "Could not be destroyed"}
          end
    end


private

def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,:password_confirmation,:phone_number, :gender, :dob, :appointment_date_time, :country, :state, :notification)
    end
  

def post_params
            params.require(:post).permit(:name,:content)

end
end