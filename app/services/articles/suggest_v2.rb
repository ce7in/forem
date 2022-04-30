module Articles
	class SuggestV2
		MAX_DEFAULT = 10

		def self.call(article, max: MAX_DEFAULT)
			new(article, max: max).call
		end

		def initialize(article, max: MAX_DEFAULT)
			@article = article
			@max = max
		end

		def call
			if cached_related_list_array.any?
				Article
					.published
					.where(id: cached_related_list_array)
					.order(published_at: :desc)
					.first(max)
			end
		end

		private

		attr_reader :article, :max

		def cached_related_list_array
			(article.cached_related_list || "").split(", ").map(&:to_i)
		end
	end
end

