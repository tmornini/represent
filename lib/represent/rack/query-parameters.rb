require 'cgi'

module Represent
  module Rack
    module QueryParameters
      def self.from env, cgi = CGI
        cgi.parse env['QUERY_STRING']
      end
    end
  end
end
