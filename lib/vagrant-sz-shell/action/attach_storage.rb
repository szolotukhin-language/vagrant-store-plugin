require "log4r"

module VagrantPlugins
  module VagrantSzShell
    module Action
      class AttachStorage

        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = env[:provider]
          @logger = Log4r::Logger.new('vagrant::persistentstorage::action::attachstorage')
        end

        def call(env)
          puts ">>> Attache store"

          @app.call(env)
        end
      end
    end
  end
end
