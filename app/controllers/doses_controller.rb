class DosesController < ApplicationController
  :new, :create, :destroy
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.save
    #redirection to cocktails
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    #redirect to cocktails
  end

end
