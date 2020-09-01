class Api::TextsController < ApiController
  before_action :set_text, only: [:show, :update]
  before_action :authorize_request, only: [:index, :show, :create, :update]

  def index
    render json: @current_user.texts
  end

  def show
    authorize! :read, @text
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

  def update
    authorize! :update, @text
    if @text.update(text_params)
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
