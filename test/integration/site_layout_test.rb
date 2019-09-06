require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def test_site_layout
    get root_path
    assert_template 'home/top'
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", users_new_path
    assert_select "a[href=?]", root_path
  end

end
