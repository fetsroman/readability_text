class Api::TextsController < ApplicationController
  before_action :set_text, only: [:show]
  before_action :authorize_request, only: [:index, :show, :create]

  def index
    render json: @current_user.texts
  end

  def show
    render json: @text
  end

  def create
    @text = @current_user.texts.create(text_params)

    if @text.save
      render json: @text, status: :created
    else
      render json: @text.errors, status: :unprocessable_entity
    end
  end

  private

  def set_text
    @text = Text.find(params[:id])
  end

  def text_params
    params.permit(:text)
  end
end
