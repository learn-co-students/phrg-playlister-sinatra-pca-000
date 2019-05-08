# frozen_string_literal: true

require "rack-flash"

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set(:views, proc { File.join(root, "../views/") })

  get "/" do
    erb :index
  end
end
