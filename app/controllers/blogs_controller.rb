class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
    # binding.pry  ターミナルでデバッグ
    # raise        プラウザでデバッグ
  end
  def new
    @picture = Picture.new
  end
  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end
  def create
    # Picture.create(picture_params)
    @picture = Picture.new(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"ブログを削除しました！"
  end
  private
  def picture_params
    params.require(:picture).permit(:title, :content)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end