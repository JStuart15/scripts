#!/usr/bin/env ruby

require 'thor'
require 'net/dav'

# Define the command-line parameters for +move-ivr-greeting-to-webdav+.
class MoveIvrGreetingToWebDav < Thor

  @@RECORDINGS_PATH = '/var/spool/asterisk/tmp/greeting_save'

  option :file_name, :aliases => :"-f"
  desc "move", "short description"
  long_desc <<-LONGDESC
  Move files of the pattern recording*.wav located in
  /var/spool/asterisk/tmp/greeting_save/ to a temporary
  folder on the webdav server.
  LONGDESC
  def move()

    file = options[:file_name] ? options[:file_name] : "recording*.wav"
    puts File.join(@@RECORDINGS_PATH, "**", file)
    puts Dir.glob(File.join(@@RECORDINGS_PATH, "**", file))
    puts file

  end

end

MoveIvrGreetingToWebDav.start(ARGV)
