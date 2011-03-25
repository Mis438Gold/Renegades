module Admin
  class GamesController < Admin::BaseController

    crudify :game

    def index
      search_all_games if searching?
      paginate_all_games

      render :partial => 'games' if request.xhr?
    end

    #Overload Crudify methods
    def create
      # if the position field exists, set this object as last object, given the conditions of this class.
      if Game.column_names.include?("position")
        params[:game].merge!({
            :position => ((Game.maximum(:position, :conditions => "")||-1) + 1)
          })
      end

      if (@game = Game.create(params[:game])).valid?
        create_console_games
        (request.xhr? ? flash.now : flash).notice = t(
          'refinery.crudify.created',
          :what => "'#{@game.title}'"
        )

        unless from_dialog?
          unless params[:continue_editing] =~ /true|on|1/
            redirect_back_or_default(admin_games_url)
          else
            unless request.xhr?
              redirect_to :back
            else
              render :partial => "/shared/message"
            end
          end
        else
          render :text => "<script>parent.window.location = '#{admin_games_url}';</script>"
        end
      else
        unless request.xhr?
          render :action => 'new'
        else
          render :partial => "/shared/admin/error_messages",
            :locals => {
            :object => @game,
            :include_object_name => true
          }
        end
      end
    end

    def update
      if @game.update_attributes(params[:game])
        update_console_games
        (request.xhr? ? flash.now : flash).notice = t(
          'refinery.crudify.updated',
          :what => "'#{@game.title}'"
        )

        unless from_dialog?
          unless params[:continue_editing] =~ /true|on|1/
            redirect_back_or_default(admin_games_url)
          else
            unless request.xhr?
              redirect_to :back
            else
              render :partial => "/shared/message"
            end
          end
        else
          render :text => "<script>parent.window.location = '#{admin_games_url}';</script>"
        end
      else
        unless request.xhr?
          render :action => 'edit'
        else
          render :partial => "/shared/admin/error_messages",
            :locals => {
            :object => @game,
            :include_object_name => true
          }
        end
      end
    end
    
    def destroy
      # object gets found by find_game function
      title = @game.title
      @game.consoles.clear
      if @game.destroy
        flash.notice = t('destroyed', :scope => 'refinery.crudify', :what => "'#{title}'")
      end
      redirect_to admin_games_url
    end

    def create_console_games
      params[:consoles][:id].each { |c|
        @game.consoles.push(Console.find(c))
        }
    end

    def update_console_games
      #destroy any records that may exist
      destroy_console_games

      #add the new records
      create_console_games
    end

    def destroy_console_games
      @game.consoles.clear
    end
    
  end
end
