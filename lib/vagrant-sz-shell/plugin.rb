require 'vagrant'

module VagrantPlugins
  module VagrantSzShell
    class Plugin < Vagrant.plugin('2')
      name "szshell"
      description <<-DESC
      Provides support for provisioning your virtual machines with
      shell scripts.
      DESC

      include Vagrant::Action::Builtin

      require_relative "action"

      config(:store) do
        require File.expand_path("../config", __FILE__)
        Config
      end

      provisioner(:szshell) do
        require File.expand_path("../provisioner", __FILE__)
        Provisioner
      end

      action_hook(:persistent_storage, :machine_action_up) do |hook|
        hook.after VagrantPlugins::ProviderVirtualBox::Action::SaneDefaults,
                   VagrantPlugins::VagrantSzShell::Action.create_adapter
        hook.before VagrantPlugins::ProviderVirtualBox::Action::Boot,
                    VagrantPlugins::VagrantSzShell::Action.create_storage
        hook.before VagrantPlugins::ProviderVirtualBox::Action::Boot,
                    VagrantPlugins::VagrantSzShell::Action.attach_storage

        hook.after VagrantPlugins::ProviderVirtualBox::Action::CheckGuestAdditions,
                   VagrantPlugins::VagrantSzShell::Action.manage_storage
        # hook.after VagrantPlugins::PersistentStorage::Action.attach_storage,
        #            VagrantPlugins::VagrantSzShell::Action.manage_storage
      end

      action_hook(:persistent_storage, :machine_action_halt) do |hook|
        hook.after VagrantPlugins::ProviderVirtualBox::Action::GracefulHalt,
                   VagrantPlugins::VagrantSzShell::Action.detach_storage
        hook.after VagrantPlugins::ProviderVirtualBox::Action::ForcedHalt,
                   VagrantPlugins::VagrantSzShell::Action.detach_storage
      end

      action_hook(:persistent_storage, :machine_action_reload) do |hook|
        hook.after VagrantPlugins::ProviderVirtualBox::Action::GracefulHalt,
                   VagrantPlugins::VagrantSzShell::Action.detach_storage
        hook.after VagrantPlugins::ProviderVirtualBox::Action::ForcedHalt,
                   VagrantPlugins::VagrantSzShell::Action.detach_storage
        hook.before VagrantPlugins::ProviderVirtualBox::Action::Boot,
                    VagrantPlugins::VagrantSzShell::Action.attach_storage
      end

      action_hook(:persistent_storage, :machine_action_destroy) do |hook|
        hook.after VagrantPlugins::ProviderVirtualBox::Action::action_halt,
                   VagrantPlugins::VagrantSzShell::Action.detach_storage
        hook.before VagrantPlugins::ProviderVirtualBox::Action::Destroy,
                    VagrantPlugins::VagrantSzShell::Action.detach_storage
      end
    end
  end
end
