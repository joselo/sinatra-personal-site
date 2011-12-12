require 'rubygems'  
require 'sinatra'
require 'haml'
require 'sass'

if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
  begin
    rvm_path     = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
    rvm_lib_path = File.join(rvm_path, 'lib')
    $LOAD_PATH.unshift rvm_lib_path
    require 'rvm'
    RVM.use_from_path! File.dirname(File.dirname(__FILE__))
  rescue LoadError
    # RVM is unavailable at this point.
    raise "RVM ruby lib is currently unavailable."
  end
end
 
set :public_folder, File.expand_path(File.dirname(__FILE__) + '/public')
set :views, File.expand_path(File.dirname(__FILE__) + '/views')
set :environment, :production

disable :run, :reload
 
require './app'

run Sinatra::Application