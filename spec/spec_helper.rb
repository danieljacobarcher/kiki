# encoding: utf-8

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'kiki'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
