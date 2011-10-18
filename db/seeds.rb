# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create username: 'admin', password: 'admin'

review_1 = Review.create :title => "2011 Peer Review", :start_on => Time.now, :end_on => Time.now + 2.weeks
review_2 = Review.create :title => "Annual Review", :start_on => Time.now, :end_on => Time.now + 2.months

questions = ["Does the employee show up on time?", "Does the employee always do TDD?"]
questions.each {|q| review_1.questions.create! question_text: q }
questions.each {|q| review_2.questions.create! question_text: q }
