# encoding: UTF-8

require 'socket'
require 'pry'
require 'readline'
require 'pry/input_completer'
require 'json'

class PryCode::CodeServer < Pry::ClassCommand
  match "code-server"
  group "PryCode"

  description "Open code server."

  def options(opt)
    opt.banner unindent <<-USAGE
      Usage: code-server <model name>

      code-server is code completion tcp server.
    USAGE
  end

  def process
    Thread.new do
      begin
        server = TCPServer.new 9009
        puts "Start code Server OK..."
        while session = server.accept
          q = session.gets.to_s
          puts "request: #{q}"

          result = _pry_.complete(q.rstrip)
          json_string = JSON.generate({result: result}).to_s

          puts "result: #{json_string}"
          session.puts json_string
          session.close

          puts "-----------------------"
        end
      rescue => ex 
        puts "Start TCP Server Error: #{ex.message}"
      end
    end.run
  end
end

PryCode::Commands.add_command PryCode::CodeServer
