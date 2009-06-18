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
  
end