require 'active_support/inflections'
require 'action_view/helpers'
extend ActionView::Helpers

namespace :msa do
  namespace :sync do

    desc "Pulls in fresh tweets."
    task :twitter => :environment do
      tweets = Twitter.user_timeline("msaarch")
      tweets.each do |tweet|
        begin
          Update.create :body => tweet.text, :active => true, :created_at => tweet.created_at, :twitter_id => tweet.id.to_s
        rescue ActiveRecord::StatementInvalid
        end
      end
    end

  end
end
