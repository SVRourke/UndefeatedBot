require 'selenium-webdriver'
require 'pry'


driver = Selenium::WebDriver.for :firefox

# .find_element(:css, "button.add-to-cart-button").text().upcase
# driver.find_element(:css, add_button).text()

in_stock = "https://undefeated.com/collections/all/products/air-cross-trainer-3-low-white-ltsmokegrey-racerblue-black?variant=31714361802825"
sold_out = "https://undefeated.com/collections/all/products/yeezy-boost-350-v2-citrin?variant=31506303975497"

def put_stats(driver)
   puts "Product: #{driver.find_element(:css, "h1.product-single__title").text()}"
   puts "Price: $#{driver.find_element(:css, "span#ProductPrice > span.money").text()}"
end

def getSizes(driver)
    sizes = Hash.new()
    driver.find_elements(:css, "select#SingleOptionSelector-1 > option").each do |e|
        val = e.attribute('value')
        txt = e.text()
        if txt != "SELECT SIZE"
            val == txt ? sizes[val.to_sym] = true : sizes[val.to_sym] = false
        end
    end
    sizes
end

def noneAvailable?(driver)
    begin
        if !! driver.find_element(:css, "button#AddToCart--product-template_un")
            false
        end
    rescue
        true
    end
end

def addToCart(driver, size)
    sizeOption = driver.find_elements(:css, "select#SingleOptionSelector-1 > option").find {|e| e.attribute('value' == size)}
    sizeOption.click()
end

driver.navigate.to in_stock
put_stats(driver)
binding.pry
# title = driver.find_element(:css, "h1.product-single__title").text()
# price = driver.find_element(:css, "span#ProductPrice > span.money").text()
# addToCart = driver.find_element(:css, "button#AddToCart--product-template_un")
driver.quit


