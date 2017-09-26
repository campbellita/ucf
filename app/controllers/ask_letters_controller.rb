class AskLettersController < ApplicationController
  def index
    @ask_letters = AskLetter.all

    render("ask_letters/index.html.erb")
  end

  def show
    @ask_letter = AskLetter.find(params[:id])

    render("ask_letters/show.html.erb")
  end

  def new
    @ask_letter = AskLetter.new

    render("ask_letters/new.html.erb")
  end

  def create
    @ask_letter = AskLetter.new

    @ask_letter.letter_image = params[:letter_image]
    @ask_letter.date = params[:date]
    @ask_letter.organization_id = params[:organization_id]

    save_status = @ask_letter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ask_letters/new", "/create_ask_letter"
        redirect_to("/ask_letters")
      else
        redirect_back(:fallback_location => "/", :notice => "Ask letter created successfully.")
      end
    else
      render("ask_letters/new.html.erb")
    end
  end

  def edit
    @ask_letter = AskLetter.find(params[:id])

    render("ask_letters/edit.html.erb")
  end

  def update
    @ask_letter = AskLetter.find(params[:id])

    @ask_letter.letter_image = params[:letter_image]
    @ask_letter.date = params[:date]
    @ask_letter.organization_id = params[:organization_id]

    save_status = @ask_letter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ask_letters/#{@ask_letter.id}/edit", "/update_ask_letter"
        redirect_to("/ask_letters/#{@ask_letter.id}", :notice => "Ask letter updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Ask letter updated successfully.")
      end
    else
      render("ask_letters/edit.html.erb")
    end
  end

  def destroy
    @ask_letter = AskLetter.find(params[:id])

    @ask_letter.destroy

    if URI(request.referer).path == "/ask_letters/#{@ask_letter.id}"
      redirect_to("/", :notice => "Ask letter deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Ask letter deleted.")
    end
  end
end
