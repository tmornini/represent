# encoding: UTF-8

Encoding.default_internal = Encoding.default_external = 'UTF-8'

$LOAD_PATH.unshift 'lib'

require 'json'
require 'pp'

require 'rubygems'
require 'bundler/setup'

require 'represent/rack/middleware'

use Represent::Rack::Middleware
run(
  proc do |env|
    [200, { }, [ JSON.pretty_generate(env[:represent]) ]]
  end
)
