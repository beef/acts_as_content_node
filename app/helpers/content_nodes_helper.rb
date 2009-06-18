module ContentNodesHelper
  
  def content_status(node)
    if node.published_at
      '<span class="status approved">Approved</span>'
    elsif node.published_at.nil?
      '<span class="status draft">Draft</span>'
    else
      '<span class="status hidden">Hidden</span>'
    end
  end
  
  def publish_select(form)
    render :partial => '/content_nodes/publish_select', :locals => { :f => form}
  end
  
end