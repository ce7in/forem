module Articles
	module Feeds
		module Unanswered
			def self.call(tag: nil, number_of_articles: Article::DEFAULT_FEED_PAGINATION_WINDOW_SIZE, page: 1)
				articles = ::Articles::Feeds::Tag.call(tag)

				articles
					.where("comments_count = 0")
					.order(published_at: :desc)
					.page(page)
					.per(number_of_articles)
			end
		end
	end
end

