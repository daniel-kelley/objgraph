#
#  objgraph.rb
#
#  Copyright (c) 2022 by Daniel Kelley
#
# SPDX-License-Identifier: MIT
#

require 'pp'
require_relative 'nm'

class ObjGraph

  def initialize(options)
  end

  def scan(args)
    @nm = scan_objs(args)
  end

  def report
    pp(@nm)
  end

  private

  def scan_objs(objs)
    h = {}
    objs.each do |path|
      h[path] = NM.new(path)
    end
    h
  end

end
