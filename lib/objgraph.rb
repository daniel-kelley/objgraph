#
#  objgraph.rb
#
#  Copyright (c) 2022 by Daniel Kelley
#
# SPDX-License-Identifier: MIT
#

require_relative 'nm'

class ObjGraph

  def initialize(options)
  end

  def scan(args)
    @nm = scan_objs(args)
    @dep = dependencies
    @edge = edges
  end

  def report
    puts "digraph g {"
    @edge.each do |edge_name, edge_syndrome|
      puts edge_name
      edge_syndrome.each do |ref|
        puts "  # #{ref}"
      end
      puts ""
    end
    puts "}"
  end

  private

  def dependencies
    dep = {}
    @nm.each do |dpath, sym|
      dep[dpath] = {}
      syndrome = []
      sym.defn.each do |defn|
        @nm.each do |rpath, rsym|
          next if dpath == rpath
          if rsym.extern.include?(defn)
            if dep[dpath][rpath].nil?
              dep[dpath][rpath] = []
            end
            dep[dpath][rpath] << defn
          end
        end
      end
    end
    dep
  end

  def edges
    edge = []
    @dep.each do |k1,v1|
      v1.each do |k2,v2|
        # complicated projects may need something more sophisticated.
        b1 = File.basename(k1)
        b2 = File.basename(k2)
        e = "  \"#{b2}\" -> \"#{b1}\""
        edge << [e,v2]
      end
    end
    edge.sort
  end

  def scan_objs(objs)
    h = {}
    objs.each do |path|
      h[path] = NM.new(path)
    end
    h
  end

end
