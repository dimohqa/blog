class DraftsController < ApplicationController
  def index
    @drafts = Draft.all
  end

  def show
    unless Draft.exists?(params[:id])
      redirect_to drafts_path
      return
    end

    @draft = Draft.find(params[:id])
  end

  def new
    @draft = Draft.new
  end

  def publish
    @draft = Draft.find(params[:id])
    @post = Post.create(title: @draft.title, body: @draft.body, author: current_user.id)
    @draft.destroy

    @post.save

    redirect_to posts_path
  end

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

  def update
    @draft = set_draft

    if @draft.update(draft_params)
      redirect_to @draft
    else
      render edit_draft_path
    end
  end

  def destroy
    @draft.destroy
    respond_to do |format|
      format.html { redirect_to drafts_url, notice: 'Draft was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_draft
    @draft = Draft.find(params[:id])
  end

  def draft_params
    req_body = params.require(:draft).permit(:title, :body)
    req_body[:author] = current_user.id

    req_body
  end
end
