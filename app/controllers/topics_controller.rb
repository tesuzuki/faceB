class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show,:edit, :update, :destroy]
  def index
    @topics=Topic.all
    @users=User.all
  end

  def new
    @topic=Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end
  
  def update
    @topic.update(topics_params)
    redirect_to topics_path
  end
  
  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def edit
  end
  
  def destroy
    
    @topic.destroy
    redirect_to topics_path,notice: "ブログを削除しました！"
  end
  
  private
    def topics_params
      params.require(:topic).permit(:title, :content,:user_id)
    end
    
    def set_topic
      @topic = Topic.find(params[:id])
    end
end
