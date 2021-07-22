# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/formatter/base'
require './lib/log_processor/formatter/uniq'

RSpec.describe LogProcessor::Formatter::Uniq do
  describe 'formatter value' do
    it 'returns the formatter value to unique views' do
      expect(described_class::FORMATTER).to eq('unique views')
    end
  end

  describe '#call' do
    include_context 'temp file data'

    def formatted_string
      str = ''
      sorted_desc_total_data.each do |key, value|
        str += "#{key} #{value} unique views\n"
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
