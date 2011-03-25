module NavigationHelpers
  module Refinery
    module Games
      def path_to(page_name)
        case page_name
        when /the list of games/
          admin_games_path

         when /the new game form/
          new_admin_game_path
        else
          nil
        end
      end
    end
  end
end
