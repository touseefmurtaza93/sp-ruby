# frozen_string_literal: true

require 'pry'
require_relative './file_reader'
require_relative './processor'
require_relative './formatter/base'
require_relative './formatter/total'
require_relative './formatter/uniq'
require_relative './counter/base'
require_relative './counter/total'
require_relative './counter/uniq'
require_relative './sorter/base'
require_relative './sorter/ascending'
require_relative './sorter/descending'

module LogProcessor
  # lib/parser
  class Parser
    attr_reader :file_path

    def initialize(file_path:)
      @file_path = file_path
    end

    def self.call(file_path:)
      new(file_path: file_path).call
    end

    def call
      logs_content = LogProcessor::FileReader.call(file_path: @file_path)
      processed_logs = LogProcessor::Processor.call(logs_content)
      total_views = LogProcessor::Counter::Total.call(processed_logs)
      uniq_views = LogProcessor::Counter::Uniq.call(processed_logs)
      stdout_output(sort_logs_desc(total_views), sort_logs_desc(uniq_views))
    end

    private

    def stdout_output(total_views, uniq_ip_views)
      LogProcessor::Formatter::Total.call(total_views)
      LogProcessor::Formatter::Uniq.call(uniq_ip_views)
    end

    def sort_logs_desc(logs)
      LogProcessor::Sorter::Descending.call(logs)
    end
  end
end
