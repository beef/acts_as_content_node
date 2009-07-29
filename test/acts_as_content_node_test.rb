require 'test_helper'

class ContentNodeTest < Test::Unit::TestCase
  should_validate_presence_of :title
  
  should_belong_to :updated_by
  should_belong_to :created_by

  context "With an exisiting content node" do
    setup do
      @content_node = Factory(:content_node)
    end
  
    should_validate_uniqueness_of :title, :message => 'has been used before'
    
    should "be found by user" do
      assert_equal [@content_node], ContentNode.authored_by(@content_node.created_by)
    end
    
    should "be found by user id" do
      assert_equal [@content_node], ContentNode.authored_by(@content_node.created_by.id)
    end

    should "be found by all if user nil" do
      assert !ContentNode.authored_by(nil).empty?
    end
  
  end
  
  
  context 'When permalink is not set it' do
    setup do
      @title = 'My nice article'
      @content_node = Factory(:content_node, :title => @title)
    end
  
    should "be based on title" do
      assert_equal @content_node.permalink, @title.parameterize
    end
    
    should "be based on permalink set when updated" do
      @content_node.update_attributes(:permalink => 'a-perma')
      assert_equal @content_node.permalink, 'a-perma'.parameterize
    end
    
    teardown do
      @content_node.destroy
    end
  end
  
  context 'When permalink is set' do
    setup do
      @permalink = 'something-else'
      @content_node = Factory(:content_node, :permalink => @permalink)
    end
  
    should_validate_uniqueness_of :permalink, :message => 'has been used before'
  
    should "be the permalink" do
      assert_equal @content_node.permalink, @permalink.parameterize
    end
  
    should "be based on title if updated and title changed" do
      @content_node = ContentNode.first
      @content_node.update_attributes(:title => 'New Title')
      assert_equal @content_node.permalink, 'New Title'.parameterize
    end
    
    should "be the permalink if updated and title not changed" do
      @content_node = ContentNode.first
      @content_node.save
      assert_equal @content_node.permalink, @permalink.parameterize
    end
    
    teardown do
      @content_node.destroy
    end
  end
  
  context 'When publish is set' do
    setup do
      @content_node = Factory(:content_node, :publish => true)
    end
  
    should "be based published" do
      assert @content_node.published?
    end
    
    should "not be published if updated and hide set" do
      @content_node.update_attributes(:hide => true)
      assert !@content_node.published?
    end
    
    
    # teardown do
    #   @content_node.destroy
    # end
  end
  
end
