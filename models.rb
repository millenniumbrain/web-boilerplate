require 'logger'
require 'sequel'

DB = Sequel.sqlite('db/test.sqlite')
DB.loggers << Logger.new($stdout)

Sequel.default_timezone = :utc
Sequel.datetime_class = DateTime
Sequel::Model.plugin :timestamps, :update_on_create => true

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |f| require f}
