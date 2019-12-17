require 'bundler'
Bundler.require

Envyable.load('./config/env.yml')

require './app.rb'
run FaxApp
