require 'represent/http-1.1/entities/request'

require 'represent/rack/message-headers'
require 'represent/rack/query-parameters'

module Represent
  module Rack
    class Middleware
      def initialize app
        @app = app
      end

      def call env, parameters = QueryParameters, headers = MessageHeaders
        env[:represent] =
          {
            method:            env['REQUEST_METHOD'],
            path:              env['PATH_INFO'],
            query_parameters:  parameters.from(env),
            http_version:      env['HTTP_VERSION'],
            message_headers:   headers.from(env),
            remote_ip_address: env['REMOTE_ADDR']
          }

        @app.call env
      end
    end
  end
end
