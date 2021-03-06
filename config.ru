require './config/environment'
require 'sinatra'
if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
use ParentController
use ChildController
