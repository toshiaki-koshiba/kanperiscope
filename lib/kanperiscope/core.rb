require 'capybara-webkit'

module Kanperiscope
  class Core
    include Capybara::DSL

    Capybara.configure do |config|
      config.match = :prefer_exact
      config.ignore_hidden_elements = false
    end
    Capybara.default_driver = :webkit
    Capybara.javascript_driver = :webkit
    
    def test
      visit 'http://helpx.adobe.com/jp/flash-player/kb/235703.html'
      save_screenshot('spec/check_flash.png')

      `open spec/check_flash.png`

      binding.pry
      
      visit 'http://www.dmm.com/netgame/social/application/-/detail/=/app_id=854854/'
      click_button('ゲームをはじめる')

      within(:xpath, "//div[@id='content']") do
        fill_in 'login_id', :with => ENV['DMM_USER']
        fill_in 'password', :with => ENV['DMM_PASS']
        click_button('ログイン')
      end

      sleep 5
      save_screenshot('spec/logined.png')

      `open spec/logined.png`

      binding.pry
      return false
    end
  end
end
