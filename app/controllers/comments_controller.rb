class CommentsController < ApplicationController
  #def index
  #  @comments = Comment.find(:all, :conditions => {:post_id => params[:post_id]}) #['post_id=?', params[:post_id]]

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @comments }
  #  end
  #end

  #def new
  #  @comment = Comment.new(:post_id => params[:post_id])

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.xml  { render :xml => @post }
  #  end
  #end

  # GET /posts/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @comment  = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(post_path(@comment.post_id)) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :controller => "post", :action => "show" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
