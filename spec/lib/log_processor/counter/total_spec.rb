# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/counter/base'
require './lib/log_processor/counter/total'

RSpec.describe LogProcessor::Counter::Total do
  describe '#call' do
    include_context 'temp file data'

    it 'returns the transformed total counted values' do
      expect(described_class.call(processed_data)).to eq(total_counted_data)
    end
  end
end
