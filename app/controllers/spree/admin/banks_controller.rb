module Spree
  module Admin
    class BanksController < ResourceController
      # Spree 5.2 の設定エリア扱いにする(設定サイドバー＋設定レイアウトを使う)。
      # これが無いと通常のメインサイドバーで表示され、設定メニューから来ても設定の文脈が外れる。
      include Spree::Admin::SettingsConcern

      def toggle_activation
        @bank.toggle!(:active)
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to admin_banks_path }
        end
      end

      private

      def scope
        Spree::Bank.all.order(created_at: :desc)
      end

      def find_resource
        scope.find_by(id: params[:id])
      end

      def collection
        return @collection if @collection.present?

        params[:q] ||= {}
        @collection = scope

        @search = @collection.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(params[:per_page])
      end

      def location_after_save
        admin_banks_path
      end

      def permitted_resource_params
        params.require(:bank).permit(:name, :account_no, :additional_details, :active)
      end
    end
  end
end
