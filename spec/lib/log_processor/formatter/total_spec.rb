# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/formatter/base'
require './lib/log_processor/formatter/total'

RSpec.describe LogProcessor::Formatter::Total do
  describe 'formatter value' do
    it 'returns the formatter value to visits' do
      expect(described_class::FORMATTER).to eq('visits')
    end
  end

  describe '#call' do
    include_context 'temp file data'

    def formatted_string
      str = ''
      sorted_desc_total_data.each do |key, value|
        str += "#{key} #{value} visits\n"
      end
      str
    end

    it 'returns the formatted data' do
      expect do
        described_class.call(sorted_desc_total_data)
      end.to output(formatted_string).to_stdout
    end
  end
end
