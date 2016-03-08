# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Category.delete_all

User.create!(username: "Marshall", password: "password", status: "admin")
User.create!(username: "Jim", password: "password", status: "admin")
User.create!(username: "Meagan", password: "password", status: "admin")
User.create!(username: "James", password: "password", status: "admin")
User.create!(username: "Sabri", password: "password", status: "admin")

Category.create!(title: "Trains")
Category.create!(title: "Planes")

Article.create!(title: "Trains for Squirrels", author_id: 1, featured: true, category_id: 1)
Version.create!(article_id: 1, editor_id: 2, content:"The inside of a CTA train car is blanketed with ads.  Companies hawk products and pharmaceutical studies need subjects; a red-state governor wants Illinois businesses to migrate. Some of the advertising is in the public interest: riders are told to donate organs and give money to worthy causes and encouraged not to drink under-age. We are also, naturally, warned against potentially psychopathic squirrels.

Chicago comedian Ben Larrison and his Chicago CTA Project added that last alert to the commercial clamor. Larrison raised a little more than $4,000 from ninety-one Kickstarter supporters to put a pair of comedic ad campaigns into one hundred Red Line cars—one out of every four. The ads went up January 15.

The “Facts about Squirrels” campaign warns commuters about the dangers posed by the ubiquitous rodents (sample copy: “Statistically speaking, at least one ‘person’ on this train is actually seven squirrels dressed up in human clothing. Can you spot him/her? #SquirrelTruth”). His other campaign, “…Vanessa?”, tries to woo back an imagined ex named Vanessa by citing personal accomplishments, like overcoming a dog allergy or wearing button-down shirts (“It’s a good look for me, I think”).

A vote by the Kickstarter contributors picked …Vanessa? and Facts about Squirrels out of six campaign choices, winning them a spot on the trains. Facts about Squirrels attracted the most votes, and represents the vast majority of Chicago CTA Project’s ad buy.

Larrison said he is pleased by the #SquirrelTruth phenomenon, which has spread across Twitter.

“My absolute favorite are the people who are just utterly bewildered and totally confused. Someone on the first day of them being up posted what I think is still my favorite—I think it was a tweet. All it said was ‘What the actual hell? #SquirrelTruth.’ I really, really, really enjoyed that,” Larrison said.

Larrison’s pitch for the project presents the joke as a chance to push back against omnipresent advertising, and to lighten the load on oppressed commuters. “It’s kind of eerie if you take a step back—like, if you look out the window right now—how many different places involve marketing. So it seemed nice to be able to reclaim a little bit of public space and take it away from marketing and do something fun and silly with it,” Larrison said.

The Facts about Squirrels campaign was meant to look professionally done, according to Larrison, mimicking the frantic sincerity of public service announcements on a crusade against lead paint or manspreading (when a male spreads his legs to show his crotch on the subway).

The pared-down style of the …Vanessa? ads was inspired by ads with a very personal target and a scattershot approach: a wedding proposal featured on a bus depot billboard and a website created to try to rekindle an old flame were two of Larrison’s examples.

The project’s existence is a joke in itself; the word “absurd” comes up a lot when Larrison talks about it. But a $4,000 price tag can make a good gag—say, nonsense ads on the CTA—seem suspiciously earnest. For Larrison, Kickstarter circumvented that problem; lots of small donations put the whim back into whimsical, and put advertisements promoting desperate love and squirrel paranoia in Red Line cars from Howard to 95th/Dan Ryan.")
