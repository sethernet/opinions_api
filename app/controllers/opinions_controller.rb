class OpinionsController < ApplicationController

  # GET /opinions/query
  def query
    @opinions = Opinion.search(params[:query])

    if @opinions.empty?
      render :json => {error: "Please enter a valid URL"}, :status => :bad_request
    else
      render json: @opinions
    end
  end

  private
    def opinion_params
      params.require(:opinion).permit(:name, :percentage_yes, :percentage_no, :query)
    end
end
