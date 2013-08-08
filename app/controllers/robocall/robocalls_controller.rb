require_dependency "robocall/application_controller"

module Robocall
  class RobocallsController < ApplicationController
    # GET /robocalls
    # GET /robocalls.json
    def index
      @robocalls = Robocall.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @robocalls }
      end
    end
  
    # GET /robocalls/1
    # GET /robocalls/1.json
    def show
      @robocall = Robocall.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @robocall }
      end
    end
  
    # GET /robocalls/new
    # GET /robocalls/new.json
    def new
      @robocall = Robocall.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @robocall }
      end
    end
  
    # GET /robocalls/1/edit
    def edit
      @robocall = Robocall.find(params[:id])
    end
  
    # POST /robocalls
    # POST /robocalls.json
    def create
      @robocall = Robocall.new(params[:robocall])
  
      respond_to do |format|
        if @robocall.save
          format.html { redirect_to @robocall, notice: 'Robocall was successfully created.' }
          format.json { render json: @robocall, status: :created, location: @robocall }
        else
          format.html { render action: "new" }
          format.json { render json: @robocall.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /robocalls/1
    # PUT /robocalls/1.json
    def update
      @robocall = Robocall.find(params[:id])
  
      respond_to do |format|
        if @robocall.update_attributes(params[:robocall])
          format.html { redirect_to @robocall, notice: 'Robocall was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @robocall.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /robocalls/1
    # DELETE /robocalls/1.json
    def destroy
      @robocall = Robocall.find(params[:id])
      @robocall.destroy
  
      respond_to do |format|
        format.html { redirect_to robocalls_url }
        format.json { head :no_content }
      end
    end
  end
end
