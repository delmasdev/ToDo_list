class EmailsController < ApplicationController
  def index
    @email = Email.all
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end
  end

  def create
    @new_mail = Email.new(object: Faker::DcComics.title,
                          body: Faker::Lorem.paragraph_by_chars
                          )
    if  @new_mail.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end
      flash[:notice] = "Email Reçu"
    else
      redirect_to root_path
      flash[:notice] = "Erreur"
    end
  end

  def update
      @email = Email.find(params[:id])
      @email.update(read: params[:read])
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
  end


  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end
  end




end
