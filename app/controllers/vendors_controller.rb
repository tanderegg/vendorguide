class VendorsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def show
    @vendor = Vendor.find params[:id]
    @review = Review.new :vendor => @vendor, :user => @current_user
  end

  def create
    @vendor = Vendor.create params[:vendor]

    if @vendor.valid?
      redirect_to @vendor
    else
      render :action => 'new'
    end
  end

  def edit
    @vendor = Vendor.find params[:id]
  end

  def update
    @vendor = Vendor.find params[:id]

    if @vendor.update_attributes(params[:vendor])
      redirect_to @vendor
    else
      render :action => 'edit'
    end
  end
end
