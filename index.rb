require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class ForMotherTests < Test::Unit::TestCase

	def test_register_email
		File.open('./mail_list.txt', 'r:utf-8') do |f|
		  f.each_line do |line|
		    input_email(line)
		    sleep 1
		  end
		end
	end

	def input_email(register_email)
		selenium = Selenium::WebDriver.for(:firefox)
		selenium.get("https://www.hotpepper.jp/SA11/")
		
		wait = Selenium::WebDriver::Wait.new(:timeout => 120) # seconds

		wait.until { selenium.find_element(:name, "email") }
		sleep 1
		selenium.find_element(:name, 'email').send_keys(register_email)
		selenium.find_element(:css, 'img.hover').click

		wait.until { selenium.find_element(:xpath ,"//img[@src='https://imgfp.hotp.jp/SYS/shopmm/images/button/btn_mm_regist.gif']") }
		sleep 1
		selenium.find_element(:xpath ,"//img[@src='https://imgfp.hotp.jp/SYS/shopmm/images/button/btn_mm_regist.gif']").click
		sleep 1
		selenium.quit
	end
end
