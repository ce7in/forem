module Articles
  module Feeds
    module Tag
      def self.call(tag = nil, number_of_articles: Article::DEFAULT_FEED_PAGINATION_WINDOW_SIZE, page: 1)
        articles =
          if tag.present?
            if FeatureFlag.enabled?(:optimize_article_tag_query)
              articles.published.cached_tagged_with_any(tag)
            else
              Article.published.cached_tagged_with_any(tag)
            end
           else
             Article.published.all
           end

        # articles =
        #   if tag.present?
        #     if FeatureFlag.enabled?(:optimize_article_tag_query)
        #       articles.cached_tagged_with_any(tag)
        #     else
        #       ::Tag.find_by(name: tag).articles
        #     end
        #   else
        #     Article.all
        #   end

        articles
          .limited_column_select
          .page(page)
          .per(number_of_articles)
        # .includes(top_comments: :user)
      end
    end
  end
end
