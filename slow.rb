#!/usr/bin/env ruby
require 'sinatra'
require 'json'

configure do
  set :server, :puma
  set :bind, '0.0.0.0'
  set :port, ENV['SLOW_SERVER_PORT'] || 5000
end

before do
  content_type 'application/json'

  stocks = File.readlines('stocks.json')

  @stocks_json = stocks.map do |stock|
    JSON.parse(stock)
  end
end


get %r{\A/([0-9]+)s\z} do
  num = params['captures'].first.to_i
  sleep num.to_i
  sleep = {'sleep' => "#{num}s"}
  @stocks_json.unshift(sleep).to_json
end

get %r{\A/([0-9]+)m\z} do
  num = params['captures'].first.to_i
  sleep num.to_i * 60
  sleep = {'sleep' => "#{num}m"}
  @stocks_json.unshift(sleep).to_json
end

get '/*' do
  {msg: "Hello! You hit the default route. Try /3s, /7s, /5m, 22m, etc..."}.to_json
end
