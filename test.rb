require 'selenium-webdriver'



driver = Selenium::WebDriver.for :firefox

# .find_element(:css, "button.add-to-cart-button").text().upcase
driver.find_element(:css, add_button).text()

in_stock = "https://undefeated.com/collections/all/products/air-cross-trainer-3-low-white-ltsmokegrey-racerblue-black?variant=31714361802825"
sold_out = "https://undefeated.com/collections/all/products/yeezy-boost-350-v2-citrin?variant=31506303975497"

driver.navigate.to in_stock
puts "page title is: #{driver.title}"
driver.navigate.to sold_out
puts "page title is: #{driver.title}"
sleep(100)
driver.quit