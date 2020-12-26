class DraftsController < ApplicationController
  before_action :set_draft, only: %i[show edit update destroy]

  # GET /drafts
  # GET /drafts.json
  def index
    @drafts = Draft.all
  end

  # GET /drafts/1
  # GET /drafts/1.json
  def show
    @draft = Draft.find(params[:id])
  end

  # GET /drafts/new
  def new
    @draft = Draft.new
  end

  # GET /drafts/1/edit
  def edit; end

  def publish
    # @draft = Draft.new(params[:draft_id])
    # @post = Post.new(:title => @draft.title, :body => @draft.body)

    # @draft.destroy

    # @post.save
    #
    puts params
  end

  # POST /drafts
  # POST /drafts.json
  def create
    @draft = Draft.new(draft_params)

    respond_to do |format|
      if @draft.save
        format.html { redirect_to @draft, notice: 'Draft was successfully created.' }
        format.json { render :show, status: :created, location: @draft }
      else
        format.html { render :new }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drafts/1
  # PATCH/PUT /drafts/1.json
  def update
    @draft = set_draft

    if @draft.update(draft_params)
      redirect_to @draft
    else
      render 'drafts/edit'
    end
  end

  # DELETE /drafts/1
  # DELETE /drafts/1.json
  def destroy
    @draft.destroy
    respond_to do |format|
      format.html { redirect_to drafts_url, notice: 'Draft was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_draft
    @draft = Draft.find(params[:id])
  end

  def draft_params
    req_body = params.require(:draft).permit(:title, :body)
    req_body[:author] = current_user.id

    req_body
  end
end
