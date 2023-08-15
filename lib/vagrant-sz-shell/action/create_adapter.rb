require "log4r"

module VagrantPlugins
  module VagrantSzShell
    module Action
      class CreateAdapter

        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = env[:provider]
          @logger = Log4r::Logger.new('vagrant::persistent_storage::action::create_adapter')
        end

        def call(env)
          puts ">>> Create adapter"

          @app.call(env)
        end

      end
    end
  end
end
