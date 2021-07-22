# frozen_string_literal: true

module LogProcessor
  module Counter
    # Logs counter
    class Base
      # attr_reader :content

      def self.call(content)
        new(content).call
      end

      def initialize(content)
        @content = content
      end

      def call
        @content.transform_values do |ips|
          self.class.count(ips)
        end
      end

      def count(ips)
        raise NotImplementedError
      end
    end
  end
end
