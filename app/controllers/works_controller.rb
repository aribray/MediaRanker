# frozen_string_literal: true

require 'pry'
class WorksController < ApplicationController
  def main; end

  def index
    @works = Work.all
  end

  def show
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
    redirect_to works_path if @work.nil?
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    is_successful = @work.save

    if is_successful
      redirect_to work_path(@work.id)
    else
      render :new, status: :bad_request
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def work_params
    params.require(:work).permit(:media, :title, :created_by, :published, :description)
  end
end
