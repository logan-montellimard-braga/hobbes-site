class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if user_signed_in?
      if @contact_message.author != current_user.email
        flash[:alert] = "Falsification des données pré-remplies du formulaire."
        redirect_to root_path
        return
      end
    end

    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to root_path, notice: 'Message envoyé avec succès.' }
      else
        flash.now[:alert] = "Erreur lors de l'envoi du message"
        format.html { render action: "new", alert: "Erreur lors de l'envoi du message" }
      end
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:author, :title, :text)
  end
end
