
module OpinionScraper
  class << self
    def create(params)
      topic_name = params[:topic_name]
      suggestion_text = params[:suggestion_text]
      topic = Topic.find_by(name: topic_name)
      Suggestion.new(topic: topic, text: suggestion_text)
    end
  end
end