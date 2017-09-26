class GrantsController < ApplicationController
  def index
    @grants = Grant.page(params[:page]).per(10)

    render("grants/index.html.erb")
  end

  def show
    @thank_you_letter = ThankYouLetter.new
    @check = Check.new
    @grant = Grant.find(params[:id])

    render("grants/show.html.erb")
  end

  def new
    @grant = Grant.new

    render("grants/new.html.erb")
  end

  def create
    @grant = Grant.new

    @grant.amount = params[:amount]
    @grant.fiscal_year = params[:fiscal_year]
    @grant.date_approved = params[:date_approved]
    @grant.organization_id = params[:organization_id]

    save_status = @grant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/grants/new", "/create_grant"
        redirect_to("/grants")
      else
        redirect_back(:fallback_location => "/", :notice => "Grant created successfully.")
      end
    else
      render("grants/new.html.erb")
    end
  end

  def edit
    @grant = Grant.find(params[:id])

    render("grants/edit.html.erb")
  end

  def update
    @grant = Grant.find(params[:id])

    @grant.amount = params[:amount]
    @grant.fiscal_year = params[:fiscal_year]
    @grant.date_approved = params[:date_approved]
    @grant.organization_id = params[:organization_id]

    save_status = @grant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/grants/#{@grant.id}/edit", "/update_grant"
        redirect_to("/grants/#{@grant.id}", :notice => "Grant updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Grant updated successfully.")
      end
    else
      render("grants/edit.html.erb")
    end
  end

  def destroy
    @grant = Grant.find(params[:id])

    @grant.destroy

    if URI(request.referer).path == "/grants/#{@grant.id}"
      redirect_to("/", :notice => "Grant deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Grant deleted.")
    end
  end
end
