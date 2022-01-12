#
#  nm.rb
#
#  Copyright (c) 2022 by Daniel Kelley
#

require 'set'

class NM

  # Public symbols defined
  attr_reader :defn
  # Public symbols referenced
  attr_reader :extern

  # Symbol dumper; externalize for cross-compilation analysis
  NM = ENV['NM'] || 'nm'

  def initialize(path)
    @defn = Set.new
    @extern = Set.new
    scan(path)
  end

  private

  def scan(path)
    IO.popen("#{NM} #{path}").each do |line|
      line.chomp!
      a = line.split
      case a.length
      when 2
        check_symbol(*a)
      when 3
        check_symbol(*a[1..-1])
      else
        raise "oops: handle nm format for #{line}"
      end
    end
  end

  def check_symbol(type, symbol)
    case type
    when 'U'
      @extern.add(symbol)
    when 'T'
      @defn.add(symbol)
    end
  end

end
