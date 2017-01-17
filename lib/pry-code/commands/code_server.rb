# encoding: UTF-8

require 'sinatra/base'
# require 'pry'
# require 'readline'
# require 'pry/input_completer'
require 'json'

class PryCode::CodeServer < Pry::ClassCommand
  match "code-server"
  group "Server"

  description "Open code server."

  def options(opt)
    opt.banner unindent <<-USAGE
      Usage: code-server <model name>

      code-server is code completion http server.
    USAGE
  end

  def process
    Thread.new do
        class Completion < Sinatra::Base
            set port: 9009

            get '/completion/:q' do
              content_type 'text/json'
              q = params[:q]
              result = Pry::InputCompleter.new(Readline).call q
              # result.map! do |e|
              #     e.gsub!(q, "")
              # end
              JSON.generate({result: result})
            end
            run!
        end
    end.run
  end
end

PryCode::Commands.add_command PryCode::CodeServer
