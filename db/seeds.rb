# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new(name: 'test', email: 'test@test.com', password: '123456')
user.save!

Category.create!(
  [
    {name: 'markdown'},
    {name: 'chordpro'}
  ]
)

cherry = "{title:チェリー}\n
{subtitle:スピッツ}\n
{c:BPM=97　capo:3}[C]君を忘れな[G]い　曲が[Am]りくねった道を行[Em]く\n
産ま[F]れたての太陽[C]と　夢[F]を渡る黄色い砂(す[G]な)\n
[C]二度と戻れな[G]い　くす[Am]ぐり合って転げた[Em]日 \n
きっと　[F]想像し[G]た以上に　[C]騒が[Am]しい未来が[F]僕[G]を待って[C]る"

country_road = "{title:Country Road　(Take Me Home, Country Roads(故郷に帰りたい))}\n
{subtitle:歌：John Denver　作詞・作曲：John Denver・Bill Danoff・Taffy Nivert}\n
Country [A]roads, take me [E]home
To the [F#m]place I [D]belong
West Virg[A]inia, [E]Mountain Mama
Take me [D]home, country [A]roads"

Memo.create!(
  [
    {
      title: 'チェリー',
      category_id: 2,
      group_id: 1,
      user_id: 1,
      label_list: 'cherry,chord,spitz',
      content: cherry

    },
    {
      title: 'country road',
      category_id: 2,
      group_id: 1,
      user_id: 1,
      label_list: 'cherry,chord,John Denver',
      content: country_road

    },
    {
      title: 'マークダウン',
      category_id: 1,
      group_id: 1,
      user_id: 1,
      label_list: 'bash,activerecord',
      content: "# マークダウンのテスト\n
\`\`\`bash
mymacbooc:textapp$ rails -v
Rails 5.2.4.2
\`\`\`"

    }
  ]
)

Favorite.create!(
  user_id: 1,
  memo_id: 2
)


open("spec/fixtures/1.crd", 'w'){|f|
  f.puts cherry
}
open("spec/fixtures/2.crd", 'w'){|f|
  f.puts country_road
}