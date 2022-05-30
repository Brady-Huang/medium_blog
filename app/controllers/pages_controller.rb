class PagesController < ApplicationController
  def index
    # @stories = Story.order(created_at: :desc)
    # N + 1 problem
    @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)

  end
  def show
  end
  def user
  end
end