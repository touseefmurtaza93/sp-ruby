# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/sorter/base'
require './lib/log_processor/sorter/ascending'

RSpec.describe LogProcessor::Sorter::Ascending do
  describe '#call' do
    include_context 'temp file data'

    it 'returns the asc sorted transformed total counted values' do
      sorted_data = described_class.call(total_counted_data)
      expect(sorted_data).to eq(sorted_asc_total_data)
      expect(sorted_data.first).to eq(sorted_asc_total_data.first)
    end
  end
end
