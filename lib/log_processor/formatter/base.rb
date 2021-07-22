# frozen_string_literal: true

module LogProcessor
  module Formatter
    # base formatter
    class Base
      attr_reader :content

      def self.call(content)
        new(content).call
      end

      def initialize(content)
        @content = content
      end

      def call
        content.each do |key, value|
          puts "#{key} #{value} #{self.class::FORMATTER}"
        end
      end
    end
  end
end
