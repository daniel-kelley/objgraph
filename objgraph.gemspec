#
# objgraph
#
# Copyright (c) 2022 by Daniel Kelley
#
# SPDX-License-Identifier: MIT
#

Gem::Specification.new do |s|
  s.name        = 'objgraph'
  s.version     = '0.0.1'
  s.date        = '2022-01-12'
  s.summary     = 'Link Object Dependency Grapher'
  s.description = 'Link Object Dependency Graph Generator'
  s.authors     = ['Daniel Kelley']
  s.license     = 'MIT'
  s.email       = 'dkelley@gmp.san-jose.ca.us'
  s.files       = Dir[
    'Makefile',
    'objgraph.gemspec',
    'bin/objgraph',
    'lib/*.rb',
    'lib/**/*.rb',
    'test/*.rb',
  ]
  s.homepage    = 'http://www.barelyworking.com/projects/klipfish'
end
