# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/parser'

RSpec.describe LogProcessor::Parser do
  describe '#call' do
    include_context 'temp file data'

    it 'calls the different services' do
      allow(LogProcessor::FileReader).to receive(:call)
      allow(LogProcessor::Processor).to receive(:call)
      allow(LogProcessor::Counter::Total).to receive(:call)
      allow(LogProcessor::Counter::Uniq).to receive(:call)
      allow(LogProcessor::Formatter::Total).to receive(:call)
      allow(LogProcessor::Formatter::Uniq).to receive(:call)
      allow(LogProcessor::Sorter::Descending).to receive(:call)

      described_class.call(file_path: file.path)
      expect(LogProcessor::FileReader).to have_received(:call)
      expect(LogProcessor::Processor).to have_received(:call)
      expect(LogProcessor::Counter::Total).to have_received(:call)
      expect(LogProcessor::Counter::Uniq).to have_received(:call)
      expect(LogProcessor::Formatter::Total).to have_received(:call)
      expect(LogProcessor::Formatter::Uniq).to have_received(:call)
      expect(LogProcessor::Sorter::Descending).to have_received(:call).twice
    end
  end
end
