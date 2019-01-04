# frozen_string_literal: true

namespace :migrate do
  namespace :counters do
    desc "Reprocess the User ads_count"
    task ads_owned: :environment do
      User.reset_column_information
      User.where(ads_count: 0).find_each do |u|
        User.reset_counters(u.id, :ads)
      end
    end
  end
end
