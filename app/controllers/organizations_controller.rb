class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all

    render("organizations/index.html.erb")
  end

  def show
    @organization = Organization.find(params[:id])

    render("organizations/show.html.erb")
  end

  def new
    @organization = Organization.new

    render("organizations/new.html.erb")
  end

  def create
    @organization = Organization.new

    @organization.org_name = params[:org_name]
    @organization.contact_name = params[:contact_name]
    @organization.address = params[:address]
    @organization.phone = params[:phone]

    save_status = @organization.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/organizations/new", "/create_organization"
        redirect_to("/organizations")
      else
        redirect_back(:fallback_location => "/", :notice => "Organization created successfully.")
      end
    else
      render("organizations/new.html.erb")
    end
  end

  def edit
    @organization = Organization.find(params[:id])

    render("organizations/edit.html.erb")
  end

  def update
    @organization = Organization.find(params[:id])

    @organization.org_name = params[:org_name]
    @organization.contact_name = params[:contact_name]
    @organization.address = params[:address]
    @organization.phone = params[:phone]

    save_status = @organization.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/organizations/#{@organization.id}/edit", "/update_organization"
        redirect_to("/organizations/#{@organization.id}", :notice => "Organization updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Organization updated successfully.")
      end
    else
      render("organizations/edit.html.erb")
    end
  end

  def destroy
    @organization = Organization.find(params[:id])

    @organization.destroy

    if URI(request.referer).path == "/organizations/#{@organization.id}"
      redirect_to("/", :notice => "Organization deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Organization deleted.")
    end
  end
end