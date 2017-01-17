# encoding: UTF-8

require 'pry'
require 'pry-code/version'

if defined?(Rails) && !ENV['DISABLE_PRY_RAILS']
  require 'pry-code/railtie'
  require 'pry-code/commands'
  require 'pry-code/model_formatter'
end
