# frozen_string_literal: true

require 'test_helper'
require 'pry'

describe WorksController do
  let(:work) { works(:book) }

  describe 'main' do
    it 'should get main' do
      get root_path
      value(response).must_be :successful?
    end
  end

  describe 'index' do
    it 'should get index' do
      get works_path
      value(response).must_be :successful?
    end
  end

  describe 'show' do
    it 'should get show' do
      get work_path(work.id)

      must_respond_with :success
    end

    it 'will redirect if the work.id is invalid' do
      get work_path(-1)

      must_respond_with :redirect
    end
  end

  describe 'new' do
    it 'should get new' do
      get new_work_path
      value(response).must_be :successful?
    end
  end

  describe 'create' do
    it 'can create a new work' do
      work_hash = {
        title: 'Test Title',
        created_by: 'Test Creator',
        published: 2019,
        media: 'album'
      }

      expect do
        post works_path, params: work_hash
      end.must_change 'Work.count', 1
    end
  end

  #   it 'should get edit' do
  #     get works_edit_url
  #     value(response).must_be :successful?
  #   end

  #   it 'should get update' do
  #     get works_update_url
  #     value(response).must_be :successful?
  #   end

  #   it 'should get destroy' do
  #     get works_destroy_url
  #     value(response).must_be :successful?
  #   end
end
