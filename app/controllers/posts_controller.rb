 class PostsController < ApplicationController
def create
        user = User.find(params[:user_id])
         if user.blank?
            return render json: {response: 500,msg: "user not found"}
        end

        user_posts = user.posts.build(post_params)
        if user_posts.save
            render json: {response: 200,msg: "Post Created", posts: user_posts}
        else
            render json: {response: 500,msg: "Post Not Created"}
        end
    end

    def index
        @user = User.find(params[:user_id])
        @posts=@user.posts
            render json: {:post => @posts}
    end
    private

def post_params
            params.require(:post).permit(:name,:content)

end
end