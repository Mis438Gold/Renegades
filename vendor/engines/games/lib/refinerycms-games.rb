require 'refinery'

module Refinery
  module Games
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "games"
          plugin.activity = {
            :class => Game}
        end
      end
    end
  end
end
