require 'spec_helper'
require 'stringio'

describe 'log note' do

  def page
    Capybara::Node::Simple.new(response.body)
  end

  class ApplicationController < ActionController::Base
  end

  controller do
    def index
      Rails.logger.error 'foo'
      Rails.logger.warn 'bar'
      render :text => '<html><head></head><body></body></html>', :content_type => 'text/html'
    end
  end

  before :all do
    Footnotes.enabled = true
  end

  after :all do
    Footnotes.enabled = false
  end

  it 'Includes the log in the response' do
    get :index
    log_debug = first('fieldset#log_debug_info div', :visible => false)
    log_debug.should have_content('foo')
    log_debug.should have_content('bar')
  end

end
