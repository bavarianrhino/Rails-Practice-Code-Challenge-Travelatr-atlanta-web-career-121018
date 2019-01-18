class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        self.posts.last(5)
    end

    def feature_post
        self.posts.order(:likes).last
    end

    def average_age
        ages = self.bloggers.map do |blogger|
            blogger.age
        end
        return average = (ages.inject(:+))/ages.count
    end
end
