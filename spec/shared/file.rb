# frozen_string_literal: true

RSpec.shared_context 'temp file data', shared_context: :metadata do
  let(:file_name) { 'webserver_logs' }
  let(:file_data) do
    ['/help_page/1 126.318.035.038',
     '/contact 184.123.665.067',
     '/contact 184.123.665.068',
     '/contact 184.123.665.068',
     '/home 184.123.665.067',
     '/about/2 444.701.448.104',
     '/help_page/1 929.398.951.889',
     '/index 444.701.448.104',
     '/help_page/1 126.318.035.038']
  end

  let(:file) do
    Tempfile.new([file_name, 'log']).tap do |f|
      file_data.each do |content|
        f << "#{content} \n"
      end

      f.close
    end
  end

  let(:processed_data) do
    { '/help_page/1' => ['126.318.035.038', '929.398.951.889', '126.318.035.038'],
      '/contact' => ['184.123.665.067', '184.123.665.068', '184.123.665.068'],
      '/home' => ['184.123.665.067'],
      '/about/2' => ['444.701.448.104'],
      '/index' => ['444.701.448.104'] }
  end

  let(:ips) do
    [
      '126.318.035.038',
      '929.398.951.889',
      '126.318.035.038',
      '184.123.665.067',
      '184.123.665.068',
      '184.123.665.068',
      '184.123.665.067',
      '444.701.448.104',
      '444.701.448.104'
    ]
  end

  let(:uniq_counted_data) do
    { '/help_page/1' => 2,
      '/home' => 1,
      '/about/2' => 1,
      '/contact' => 2,
      '/index' => 1 }
  end

  let(:total_counted_data) do
    { '/help_page/1' => 3,
      '/home' => 1,
      '/about/2' => 1,
      '/contact' => 3,
      '/index' => 1 }
  end

  let(:sorted_asc_total_data) do
    { '/home' => 1,
      '/about/2' => 1,
      '/index' => 1,
      '/help_page/1' => 3,
      '/contact' => 3 }
  end

  let(:sorted_desc_total_data) do
    { '/contact' => 3,
      '/help_page/1' => 3,
      '/index' => 1,
      '/about/2' => 1,
      '/home' => 1 }
  end
end
