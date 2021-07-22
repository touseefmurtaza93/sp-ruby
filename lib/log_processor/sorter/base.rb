# frozen_string_literal: true

module LogProcessor
  module Sorter
    # sort base
    class Base
      attr_reader :content

      def self.call(content)
        new(content).call
      end

      def initialize(content)
        @content = content
      end

      def call
        sort_by_view_count
      end

      private

      def sort_by_view_count
        @content.sort_by { |_path, count| count }
      end
    end
  end
end
