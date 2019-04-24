# frozen_string_literal: true

require 'pry'

class UsersController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(username: params[:user][:username])

    if @user.nil?
      @user = User.create(username: params[:user][:username])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      session[:user_id] = @user.id
      redirect_to rootpath
    end
  end

  def current
    @user = User.find_by(id: session[:user_id])

    unless @user
      flash[:error] = 'You must be logged in to see this page'
      redirect_to root_path
    end
  end

  def logout
    user = User.find_by(id: session[:user_id])

    unless user.nil?
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  def vote
    @work = Work.find_by(id: params[:id])
    user = User.find_by(id: session[:user_id])
    if user.nil?
      flash[:error] = 'You must log in before voting!'
      redirect_to root_path
    else
      @work.upvote_by user
      redirect_to work_path(@work.id)
    end
  end
end
