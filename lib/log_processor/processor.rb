# frozen_string_literal: true

module LogProcessor
  # Input file reader
  class Processor
    def self.call(logs_content)
      new.call(logs_content)
    end

    def call(logs_content)
      process_logs(logs_content)
    end

    private

    def process_logs(logs_content)
      logs_content.each_with_object(Hash.new { [] }) do |line, processed_logs|
        path, ip = line.split(' ')
        processed_logs[path] <<= ip
      end
    end
  end
end
