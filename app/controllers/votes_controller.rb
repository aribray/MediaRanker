class VotesController < ApplicationController
  def create
    vote = Vote.new(user_id: session[:user_id], work_id: work.id)
    if vote.save
      raise
      # user = User.find_by(id: vote.user_id)
      # work = Work.find_by(id: vote.work_id)
      work.upvotes += 1

      redirect_to work_path(vote.work_id)
    else 
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end
  private

  # def vote_params
  #    params.require(:vote).permit(:user_id, :work_id)
  # end
end

