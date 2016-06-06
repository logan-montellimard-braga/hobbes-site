class TemplatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    @template.user_id = current_user.id

    if @template.save
      redirect_to templates_path, notice: "Template ajouté avec succès !"
    else
      render 'new'
    end
  end

  def destroy
    @template = Template.find(params[:id])
    if (@template.user_id == current_user.id)
      @template.destroy
      redirect_to templates_path, notice: "Template supprimé avec succès"
    else
      redirect_to root_path, alert: "Vous ne pouvez pas supprimer le template d'un autre !"
    end
  end

  private
  def template_params
    params.require(:template).permit(:name, :description, :attachment, :image)
  end
end
