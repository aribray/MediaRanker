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

  def edit
    @work = Work.find_by(id: params[:id])

    redirect_to works_path if @work.nil?
  end

  def update
    work = Work.find_by(id: params[:id])

    if work.nil?
      redirect_to works_path
    else
      is_successful = Work.update(work_params)
    end

    redirect_to work_path(work.id) if is_successful
  end

  def destroy
    work = Work.find_by(id: params[:id])

    work.destroy
    redirect_to root_path
  end

  private

  def work_params
    params.require(:work).permit(:media, :title, :created_by, :published, :description)
  end
end
