# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/counter/base'
require './lib/log_processor/counter/uniq'

RSpec.describe LogProcessor::Counter::Uniq do
  describe '#call' do
    include_context 'temp file data'

    it 'returns the transformed uniq counted values' do
      expect(described_class.call(processed_data)).to eq(uniq_counted_data)
    end
  end
end
