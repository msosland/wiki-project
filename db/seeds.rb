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

Article.create!(title: "Train in Vain", featured: nil, status: nil, author_id: 3, category_id: 1, created_at: "2016-03-08 22:37:55", updated_at: "2016-03-08 22:37:55")

Version.create!(content: "<p><img alt=\"\" src=\"data:image/jpeg;base64,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\" style=\"margin: 10px; float: left; width: 199px; height: 198px;\" /><strong><span style=\"font-size:28px;\">Train in Vain</span></strong></p>\r\n\r\n<p>&quot;Train in Vain&quot; was added after the deal for The Clash to write a song for an&nbsp;<i><a href=\"https://en.wikipedia.org/wiki/NME\" title=\"NME\">NME</a></i>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Flexi_disc\" title=\"Flexi disc\">flexi disc</a>&nbsp;fell through, and as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Mick_Jones_(The_Clash)\" title=\"Mick Jones (The Clash)\">Mick Jones</a>&nbsp;commented, &quot;The real story on &#39;Train in Vain&#39; is that originally we needed a song to give to the&nbsp;<i>NME</i>&nbsp;for a flexi disk that&nbsp;<i>NME</i>&nbsp;was going to do. And then it was decided that it didn&#39;t work out or decided the flexi disk didn&#39;t work out so we had this spare track we had done as a giveaway. So we put it on<i>London Calling</i>&nbsp;but there wasn&#39;t time because the sleeves were already done.&quot;<sup id=\"cite_ref-MTV-Rockumentary_6-0\"><a href=\"https://en.wikipedia.org/wiki/Train_in_Vain#cite_note-MTV-Rockumentary-6\">[6]</a></sup>&nbsp;The result of its late addition was that it was the only song without lyrics printed on the insert, and was not listed as a track, although its presence is announced as the title and position on the original vinyl record was scratched into the vinyl in the needle run-off area on the fourth side of the album.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Say you stand by your man<br />\r\nTell me something I don&#39;t understand<br />\r\nYou said you love me and that&#39;s a fact<br />\r\nThen you left me, said you felt trapped<br />\r\n<br />\r\nWell some things you can explain away<br />\r\nBut my heartache&#39;s in me till this day<br />\r\n<br />\r\n<i>[Chorus]</i><br />\r\nDid you stand by me<br />\r\nNo, not at all<br />\r\nDid you stand by me<br />\r\nNo way<br />\r\n<br />\r\nAll the times<br />\r\nWhen we were close<br />\r\nI&#39;ll remember these things the most<br />\r\nI see all my dreams come tumbling down<br />\r\nI won&#39;t be happy without you around<br />\r\n<br />\r\nSo all alone I keep the wolves at bay<br />\r\nThere is only one thing that I can say<br />\r\n<br />\r\n<i>[Chorus]</i><br />\r\n<br />\r\nYou must explain why this must be<br />\r\nDid you lie when you spoke to me<br />\r\n<br />\r\nDid you stand by me<br />\r\nNo, not at all<br />\r\n<br />\r\nNow I got a job<br />\r\nBut it don&#39;t pay<br />\r\nI need new clothes<br />\r\nI need somewhere to stay<br />\r\nBut without all these things I can do<br />\r\nBut without your love I won&#39;t make it through<br />\r\n<br />\r\nBut you don&#39;t understand my point of view<br />\r\nI suppose there&#39;s nothing I can do<br />\r\n<br />\r\n<i>[Chorus]</i><br />\r\n<br />\r\nYou must explain why this must be<br />\r\nDid you lie when you spoke to me?<br />\r\n<br />\r\nDid you stand by me<br />\r\nDid you stand by me<br />\r\nNo, not at all<br />\r\nDid you stand by me<br />\r\nNo way<br />\r\nDid you stand by me<br />\r\nNo, not at all<br />\r\nDid you stand by me<br />\r\nNo way</p>\r\n", article_id: 1, editor_id: 3, created_at: "2016-03-08 22:40:10", updated_at: "2016-03-08 22:40:10")
