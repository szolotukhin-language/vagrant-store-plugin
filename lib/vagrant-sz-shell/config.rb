require 'uri'

module VagrantPlugins
  module VagrantSzShell
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :args

      def initialize
        @args = UNSET_VALUE
        @logger = Log4r::Logger.new('vagrant::sz-shell::config')

        # begin
        #   raise "My exception"
        # rescue => exception
        #   puts exception.backtrace
        # end

        @logger.info("created configuration")
      end

      def provision(name, **options, &block)
        puts @args
        puts "my #{object_id} provision --->>> #{name}"

        options.each {|key, value| puts "#{key} is #{value}" }

        nil
      end

      def validate(machine)
        errors = _detected_errors

        { "shell provisioner" => errors }
      end

      def finalize!
        @args = nil if @args == UNSET_VALUE

        # begin
        #   raise "My exception"
        # rescue => exception
        #   puts exception.backtrace
        # end
      end
    end
  end
end
