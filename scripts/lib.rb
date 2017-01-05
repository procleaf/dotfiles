#! /usr/bin/env ruby

# ------------------------------------------------------------------------------
#
# A common Ruby library.
#
# 01/04/17
#
# yqm_leaf@163.com
#
# ------------------------------------------------------------------------------

require 'digest/md5'


module Lib

  module_function

  #
  # Return a none exist file name.
  # file:    base file name pattern
  #
  def new_file(file)
    return file unless FileTest.exist?(file)
    1.upto(100) { |n| return file + n.to_s unless FileTest.exist?(file + n.to_s) }
    raise "Failed to create a none exist file name"
  end
  #
  # Determins if given files are the same.
  #
  def same_file?(*files)
    chk_sum      = Digest::MD5.hexdigest(File.read(files.shift))
    files.each do |f|
      return false unless Digest::MD5.hexdigest(File.read(f)) == chk_sum
    end
    return true
  end
end

