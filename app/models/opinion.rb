class Opinion < ApplicationRecord

  def self.search(search)
    if search.nil? || search.empty?
      @opinions = ""
    else
      @opinions = OpinionService.parse(search)
    end
  end
end
