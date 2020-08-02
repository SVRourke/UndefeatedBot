class siteInterface
    def initialize()
        @browser = Selenium::WebDriver.for :firefox
    end

    # returns a hash of the products details for use by the product object
    def product_info(url)
        @browser.navigate.to url
        
        # TODO- find a way to turn availability into Boolean Value
        info = {
            :url => url,
            # example .find_element(:css, "div.sku-title > h1").text()
            :title => @browser.find_element(:css, "").text(),
            # example .find_element(:css, "button.add-to-cart-button").text().upcase
            :availability => @browser.find_element(:css, "").text().upcase
        }
        
        info
    end

    def product_available?(product)
        @browser.navigate.to product.url
        sleep(3)
        avail_text = @browser.find_element(:css, "button.add-to-cart-button").text().upcase
        avail_text != "ADD TO CART" ? false : true
    end

    # TODO DEF LOGIN FUNCTION
    def login
    end
    
    # TODO DEF ADDTOCART
    def addToCart(product)
        # @browser.navigate.to product
        # sleep(10)
        # puts driver.find_element(:css, "button.add-to-cart-button").click()
        # sleep(10)
        # driver.navigate.to "https://www.bestbuy.com/cart"
        # sleep(10)
    end

    # ALWAYS RUN WHEN STOPPING PROGRAM
    def down
        @browser.quit
    end
end

