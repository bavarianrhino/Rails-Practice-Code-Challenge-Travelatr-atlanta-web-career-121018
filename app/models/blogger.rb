class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def feature_post
        if self.posts.present?
            self.posts.order(:likes).last
        end
    end
end
