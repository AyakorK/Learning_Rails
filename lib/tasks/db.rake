# frozen_string_literal: true

namespace :test do
  task setup: :environment do
    system('RAILS_ENV=test bundle exec rails db:drop db:create db:migrate')
  end
end
