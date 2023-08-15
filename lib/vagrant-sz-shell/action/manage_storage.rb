require "log4r"
# require 'vagrant-persistent-storage/manage_storage'

module VagrantPlugins
  module VagrantSzShell
    module Action
      class ManageAll

        # include ManageStorage

        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = @machine.provider_name
          @logger = Log4r::Logger.new('vagrant::persistent_storage::action::manage_storage')
        end

        def call(env)
          puts ">>> format disk, create / manage LVM, mount disk"

          @app.call(env)
        end
      end
    end
  end
end
