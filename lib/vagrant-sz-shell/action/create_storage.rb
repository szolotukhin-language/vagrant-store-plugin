require "log4r"

module VagrantPlugins
  module VagrantSzShell
    module Action
      class CreateStorage

        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = env[:provider]
          @logger = Log4r::Logger.new('vagrant::persistent_storage::action::create_storage')
        end

        def call(env)
          puts ">>> Create store"

          @app.call(env)
        end
      end
    end
  end
end
