require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'serve'
require 'serve/rack'

require 'thin'

root = ::File.dirname(__FILE__)

if ENV['RACK_ENV'] != 'production'
  require 'slim'
  Slim::Engine.set_default_options(:attr_wrapper => "'", :format => :xhtml, :pretty => true, :sort_attrs => true)

  require 'sass'
  require 'sass/plugin/rack'
  use Sass::Plugin::Rack

  require 'coffee-script'
end

run Rack::Cascade.new([
  Serve::RackAdapter.new(root + '/build'),
  Rack::Directory.new(root + '/build')
])
