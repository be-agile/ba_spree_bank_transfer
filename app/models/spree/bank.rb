module Spree
  class Bank < Spree.base_class
    validates :name, :account_no, presence: true
    validates_uniqueness_of :account_no, scope: :name

    scope :active, -> { where(active: true) }

    # Spree 5.2(Ransack 4.x)は検索・ソート対象を明示的に allowlist することを要求する。
    # Spree::Base のデフォルト(id/name/created_at/updated_at)に加え、admin 一覧で
    # ソート・検索しうる固有カラムを許可する(未許可カラムでのソート時に 500 を防ぐ)。
    def self.ransackable_attributes(_auth_object = nil)
      super | %w[account_no active additional_details]
    end
  end
end
