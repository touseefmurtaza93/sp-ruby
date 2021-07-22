# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/log_processor/parser'

LogProcessor::Parser.call(file_path: ARGV[0])
