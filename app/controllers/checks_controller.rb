class ChecksController < ApplicationController
  def index
    @checks = Check.all

    render("checks/index.html.erb")
  end

  def show
    @check = Check.find(params[:id])

    render("checks/show.html.erb")
  end

  def new
    @check = Check.new

    render("checks/new.html.erb")
  end

  def create
    @check = Check.new

    @check.check_image = params[:check_image]
    @check.account_type = params[:account_type]
    @check.check_number = params[:check_number]
    @check.grant_id = params[:grant_id]

    save_status = @check.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/checks/new", "/create_check"
        redirect_to("/checks")
      else
        redirect_back(:fallback_location => "/", :notice => "Check created successfully.")
      end
    else
      render("checks/new.html.erb")
    end
  end

  def edit
    @check = Check.find(params[:id])

    render("checks/edit.html.erb")
  end

  def update
    @check = Check.find(params[:id])

    @check.check_image = params[:check_image]
    @check.account_type = params[:account_type]
    @check.check_number = params[:check_number]
    @check.grant_id = params[:grant_id]

    save_status = @check.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/checks/#{@check.id}/edit", "/update_check"
        redirect_to("/checks/#{@check.id}", :notice => "Check updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Check updated successfully.")
      end
    else
      render("checks/edit.html.erb")
    end
  end

  def destroy
    @check = Check.find(params[:id])

    @check.destroy

    if URI(request.referer).path == "/checks/#{@check.id}"
      redirect_to("/", :notice => "Check deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Check deleted.")
    end
  end
end
