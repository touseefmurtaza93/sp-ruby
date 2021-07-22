# frozen_string_literal: true

module LogProcessor
  module Counter
    # Logs counter
    class Uniq < Base
      def self.count(ips)
        ips.uniq.count
      end
    end
  end
end
