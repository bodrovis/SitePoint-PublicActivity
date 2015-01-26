class StoriesController < ApplicationController
  before_action :find_story, only: [:destroy, :show, :edit, :update, :like]
  before_action :load_activities, only: [:index, :show, :new, :edit]

  def index
    @stories = Story.order('created_at DESC')
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:success] = 'Your story was added!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @story.update_attributes(story_params)
      flash[:success] = 'The story was edited!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @story.destroy
      flash[:success] = 'The story was deleted!'
    else
      flash[:error] = 'Cannot delete this story...'
    end
    redirect_to root_path
  end

  def show
  end

  def like
    without_tracking do
      @story.increment!(:likes)
    end
    @story.create_activity :like
    flash[:success] = 'Thanks for sharing your opinion!'
    redirect_to story_path(@story)
  end

  private

  def story_params
    params.require(:story).permit(:title, :body)
  end

  def find_story
    @story = Story.find(params[:id])
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end

  def without_tracking
    Story.public_activity_off
    yield if block_given?
    Story.public_activity_on
  end
end