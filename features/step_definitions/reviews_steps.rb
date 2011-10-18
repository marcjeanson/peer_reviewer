Given /^I visit the reviews page$/ do
  visit(reviews_path)
end

Given /^I visit the new review page$/ do
  visit(new_review_path)
end

Given /^the following reviews:$/ do |reviews|
  @reviews = reviews.hashes.collect { |review| Review.create!(review) }
end

When /^I submit valid new review data$/ do
  fill_in("Title", with: "Annual Review")
  select(Date.today.year.to_s, from: "review_start_on_1i")
  select(Date::MONTHNAMES[Date.today.month], from: "review_start_on_2i")
  select(Date.today.day.to_s, from: "review_start_on_3i")
  click_on("Create")
end

Then /^I should be on the reviews page$/ do
  current_path.should eq(reviews_path)
end

Then /^I should see all the reviews$/ do
  @reviews.each do |review|
    within("#review_#{review.id}") do
      [review.title, review.start_on, review.end_on].each do |content|
        page.should have_content(content)
      end
    end
  end
end

Then /^I should be on the new review page$/ do
  current_path.should eq(new_review_path)
end

Then /^I should see the new review in the list of reviews$/ do
  new_review = Review.find_by_title("Annual Review")
  within("#review_#{new_review.id}") do
    page.should have_content("Annual Review")
  end
end
