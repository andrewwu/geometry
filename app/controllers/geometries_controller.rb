class GeometriesController < ApplicationController
  def create
    @model = Model.find_by_id_and_size_id(params[:model_id], params[:size_id])

    render nothing: true, status: 400 and return unless @model

    @size = Size.find_by_id(params[:size_id])

    respond_to do |format|
      format.js
    end
  end
end
