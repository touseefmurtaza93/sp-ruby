# frozen_string_literal: true

module LogProcessor
  module Counter
    # Logs counter
    class Total < Base
      def self.count(ips)
        ips.count
      end
    end
  end
end
