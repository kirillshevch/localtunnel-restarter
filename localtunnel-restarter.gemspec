# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'localtunnel/restarter/version'

Gem::Specification.new do |spec|
  spec.name          = "localtunnel-restarter"
  spec.version       = Localtunnel::Restarter::VERSION
  spec.authors       = ["Kirill Shevchenko"]
  spec.email         = ["kirills167@gmail.com"]

  spec.summary       = "Command line tool which keeps localtunnel working"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kirillweb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["localtunnel-restarter"]
  spec.require_paths = ["lib"]
end
