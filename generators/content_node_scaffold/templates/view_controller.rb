class <%= controller_class_name %>Controller < ApplicationController
  # GET /<%= table_name %>
  # GET /<%= table_name %>.xml
  def index
    @<%= table_name %> = <%= class_name %>.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @<%= table_name %> }
    end
  end

  # GET /<%= table_name %>/1
  # GET /<%= table_name %>/1.xml
  def show
    @<%= file_name %> = <%= class_name %>.find_by_permalink(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @<%= file_name %> }
    end
  end
  
  def preview
    @page_id = '<%= table_name %>'
    @page_class = 'show'
    @<%= file_name %> = <%= class_name %>.new(session[:<%= file_name %>_preview])
    session[:<%= file_name %>_preview] = nil
    render :action => "show"
  end
end