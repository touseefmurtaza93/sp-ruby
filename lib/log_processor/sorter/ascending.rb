# frozen_string_literal: true

module LogProcessor
  module Sorter
    # sort in ASC
    class Ascending < Base
      def call
        sort_by_view_count
      end

      private

      def sort_by_view_count
        super.to_h
      end
    end
  end
end
