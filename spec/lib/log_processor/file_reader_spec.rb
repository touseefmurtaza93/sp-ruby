# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/file_reader'

RSpec.describe LogProcessor::FileReader do
  describe '#call' do
    context 'when file path is not provided' do
      it 'raise argument error exception' do
        expect { described_class.call }.to raise_error(ArgumentError)
      end
    end

    context 'when provided file path is not present' do
      it 'raise no such file present exception' do
        expect { described_class.call(file_path: 'test.log') }.to raise_error('No such file present')
      end
    end

    context 'when file is read successfully' do
      include_context 'temp file data'
      it 'returns the file content' do
        expect(described_class.call(file_path: file.path)).to eq(file_data)
      end
    end
  end
end
