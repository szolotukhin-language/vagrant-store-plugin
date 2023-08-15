require "pathname"
require "tempfile"

require "vagrant/util/downloader"
require "vagrant/util/line_buffer"
require "vagrant/util/retryable"

module VagrantPlugins
  module VagrantSzShell
    class Provisioner < Vagrant.plugin("2", :provisioner)
      def provision
        puts "Hello Serhijz"
      end
    end
  end
end
