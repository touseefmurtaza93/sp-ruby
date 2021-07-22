# frozen_string_literal: true

module LogProcessor
  # Input file reader
  class FileReader
    def self.call(file_path:)
      raise('No such file present') unless File.exist?(file_path)

      new.call(file_path: file_path)
    end

    def call(file_path:)
      read_file(file_path: file_path)
    end

    private

    def read_file(file_path:)
      logs_content = []
      File.foreach(file_path) do |line|
        logs_content << line.strip
      end

      logs_content
    end
  end
end
