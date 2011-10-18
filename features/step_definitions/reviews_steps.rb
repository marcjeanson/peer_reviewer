Given /^I visit the reviews page$/ do
  visit(reviews_path)
end

Given /^the following reviews:$/ do |reviews|
  @reviews = reviews.hashes.collect { |review| Review.create!(review) }
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
