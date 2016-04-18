module Represent
  module Rack
    module MessageHeaders
      def self.from env
        starts_with_http(but_not_http_version(env))
          .each_with_object([]) do |(key, value), memo|
            memo << {
              header_field_name: key[5..-1],
              header_field_body: value
            }
          end
      end

      private

      def starts_with_http env
        env.select do |key, _value_|
          key[0..4] == 'HTTP_'
        end
      end

      def but_not_http_version env
        env.reject do |key, _value_|
          key == 'HTTP_VERSION'
        end
      end
    end
  end
end
