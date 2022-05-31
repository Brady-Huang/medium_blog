class PagesController < ApplicationController
  before_action :find_story, only: [:show]
  def index
    # @stories = Story.order(created_at: :desc)
    # N + 1 problem
    # @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)
    # scope 
    # @stories = Story.published_stories.order(created_at: :desc).includes(:user)
    # use state machine 
    # @stories = Story.published.with_attached_cover_image.order(created_at: :desc).includes(:user)

    # using scope
    @stories = Story.published_stories

  end
  def show
    @comment = @story.comments.new
    @comments = @story.comments.order(id: :desc)
  end
  
  def user
  end

  private 
  def find_story
    @story = Story.friendly.find(params[:story_id])
  end
end