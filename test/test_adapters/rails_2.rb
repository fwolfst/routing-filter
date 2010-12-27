require 'test_helper'

if ActionPack::VERSION::MAJOR == 2
  module TestRailsAdapter
    routes = ActionController::Routing::Routes = ActionController::Routing::RouteSet.new
    routes.draw do |map|
      map.connect '/', :controller => 'rails_test/tests', :action => 'index'
      map.foo '/foo/:id', :controller => 'rails_test/tests', :action => 'show'
      map.filter :uuid, :pagination ,:locale, :extension
    end

    attr_reader :session
    delegate :get, :response, :to => :session

    def setup
      @session = ActionController::Integration::Session.new(lambda { |env| ActionController::Routing::Routes.call(env) })
    end
  end
end
