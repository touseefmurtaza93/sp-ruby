# frozen_string_literal: true

require 'shared/file'
require './lib/log_processor/processor'

RSpec.describe LogProcessor::Processor do
  include_context 'temp file data'
  subject(:process) { described_class.call(file_data) }

  describe '#call' do
    it { is_expected.to include('/help_page/1' => ['126.318.035.038', '929.398.951.889', '126.318.035.038']) }
    it { is_expected.to include('/contact' => ['184.123.665.067', '184.123.665.068', '184.123.665.068']) }
    it { is_expected.to include('/home' => ['184.123.665.067']) }
    it { is_expected.to include('/about/2' => ['444.701.448.104']) }
    it { is_expected.to include('/index' => ['444.701.448.104']) }
  end
end
