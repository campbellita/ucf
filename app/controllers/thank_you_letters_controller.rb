class ThankYouLettersController < ApplicationController
  def index
    @thank_you_letters = ThankYouLetter.page(params[:page]).per(10)

    render("thank_you_letters/index.html.erb")
  end

  def show
    @thank_you_letter = ThankYouLetter.find(params[:id])

    render("thank_you_letters/show.html.erb")
  end

  def new
    @thank_you_letter = ThankYouLetter.new

    render("thank_you_letters/new.html.erb")
  end

  def create
    @thank_you_letter = ThankYouLetter.new

    @thank_you_letter.letter_image = params[:letter_image]
    @thank_you_letter.date = params[:date]
    @thank_you_letter.organization_id = params[:organization_id]
    @thank_you_letter.grant_id = params[:grant_id]

    save_status = @thank_you_letter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/thank_you_letters/new", "/create_thank_you_letter"
        redirect_to("/thank_you_letters")
      else
        redirect_back(:fallback_location => "/", :notice => "Thank you letter created successfully.")
      end
    else
      render("thank_you_letters/new.html.erb")
    end
  end

  def edit
    @thank_you_letter = ThankYouLetter.find(params[:id])

    render("thank_you_letters/edit.html.erb")
  end

  def update
    @thank_you_letter = ThankYouLetter.find(params[:id])

    @thank_you_letter.letter_image = params[:letter_image]
    @thank_you_letter.date = params[:date]
    @thank_you_letter.organization_id = params[:organization_id]
    @thank_you_letter.grant_id = params[:grant_id]

    save_status = @thank_you_letter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/thank_you_letters/#{@thank_you_letter.id}/edit", "/update_thank_you_letter"
        redirect_to("/thank_you_letters/#{@thank_you_letter.id}", :notice => "Thank you letter updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Thank you letter updated successfully.")
      end
    else
      render("thank_you_letters/edit.html.erb")
    end
  end

  def destroy
    @thank_you_letter = ThankYouLetter.find(params[:id])

    @thank_you_letter.destroy

    if URI(request.referer).path == "/thank_you_letters/#{@thank_you_letter.id}"
      redirect_to("/", :notice => "Thank you letter deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Thank you letter deleted.")
    end
  end
end
