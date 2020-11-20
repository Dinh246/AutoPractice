Given("get to the testing page") do
  $driver.get "http://practice.automationtesting.in/"
end

When("user in Shop Menu and click on Home Menu button") do
  Kernel.puts "You're now in the Homepage"
end

Then("the Homepage must contains three Sliders only") do
  @Sliders = $driver.find_elements(:css, ".n2-ss-slide-fill")
  Kernel.puts "The number of Sliders in Homepage are #{@Sliders.size}"
  expect(@Sliders.count).to eq(3)
end

Then("the Homepage must contains three Arrivals only") do
  @Arrivals = $driver.find_elements(:css, ".wp-post-image")
  Kernel.puts "The number of Arrivals in Homepage are #{@Arrivals.count}"
  expect(@Arrivals.count).to eq(3)
end

When("user in Shop Menu and click on Home Menu button and click image in Arrivals") do
  @click_on = ""
  Kernel.puts "Enter number of image you want to click: " + @click_on
  @click_on = STDIN.gets.chomp
end

Then("image should be clickable and should navigate to next page where user can add that book to his basket") do
  if @click_on.to_i == 1
    @img_1 = $driver.find_element(:xpath, "//img[@title='Selenium Ruby']")
    @img_1.click
  elsif @click_on.to_i == 2
    @img_2 = $driver.find_element(:css, ".wp-post-image[title='Thinking in HTML']")
    @img_2.click
  elsif @click_on.to_i == 3
    @img_3 = $driver.find_element(:xpath, "//img[@title='Mastering JavaScript']")
    @img_3.click
  end
  $driver.manage.timeouts.implicit_wait = 5
  @stock = $driver.find_element(:css, ".stock")
  begin
    @add_btn = $driver.find_element(:css, ".alt")
    @add_btn.displayed? == true
    expect(@stock.text).to include("in stock")
    Kernel.puts "You're in the product details page"
  rescue => exception
    @add_btn.display == nil
    expect(@stock.text).to include("Out of stock")
    Kernel.puts "You're in the PDP and The product is out of stock"
  end
end

Then("click on the description tab and there should be a description regarding that book customer clicked on") do
  @description = $driver.find_element(:xpath, "//div[@id='tab-description']")
  Kernel.puts @description.text
  if @click_on.to_i == 1
    expect(@description.text).to include("The Selenium WebDriver Recipes book is a quick problem-solving guide to automated testing")
  elsif @click_on.to_i == 2
    expect(@description.text).to include("This book provides you with an intermediate knowledge of HTML")
  elsif @click_on.to_i == 3
    expect(@description.text).to include("It would seem that everything that needs to be written about JavaScript has been written")
  end
end

Then("click on the reviews tab and there should be a reviews regarding that book customer clicked on") do
  @reviews = $driver.find_element(:css, ".reviews_tab")
  @reviews.click
  @content = $driver.find_element(:css, "#reviews")
  Kernel.puts @content.text
  if @click_on == 1
    expect(@content.text).to include("Selenium Ruby")
  elsif @click_on == 2
    expect(@content.text).to include("Thinking in HTML")
  elsif @click_on == 3
    expect(@content.text).to include("Mastering JavaScript")
  end
  Kernel.puts "You're now in the Reviews tab"
end

Then("click on the Add to basket button and user can see the book in the Menu item with price") do
  begin 
    @click_on == 1 || @click_on == 3
    @add_btn.click
    $driver.manage.timeouts.implicit_wait = 5
    $driver.find_element(:css, ".wc-forward").click
    @basket_totals = $driver.find_element(:css, ".cart_totals").text
    @total = $driver.find_element(:css, ".product-subtotal[data-title='Total']").text
    expect(@basket_totals).to include("Basket Totals")
    Kernel.puts "You're now in your basket & your total price w/o tax is: #{@total}"
  rescue => e
    @click_on == 2
    Kernel.puts "The product is out of stock can't add to your basket"
  end
end
