## composer memo's

## design
- 日記アプリ兼メモアプリ
- タスク管理もしたいなああ。。
- mark down,chord pro形式で入力、保存できるメモアプリ。
- タグがつけられる
- タグで検索できる、自動的に分けられる
- 自分のページしか見れないようにする
- 画像を登録できるようにする
- 日記アプリのようにカレンダーで遡れる
- メモの検索が可能

## Database design

### users table
| column | type | option |
| :---: | :---: | :-----: |
|name|string|null: false<BR> unique: true|
|mail|string|null: false<BR> unique: true|
|password|string|null: false|

#### association
- has_many memos
￼
 

### notes table
| column | type | option |
| :---: | :---: | :----: |
| title | string | --- |
| body | text | --- |
| image | text | --- |
| category | string | null: false<BR>unique: true |
| tag | references | unique: true<BR>foreign_key: true |
| group | string | unique: true<BR>oreign_key: true |

####  association
- has_many users
- belongs_to category
- belongs_to groups
- has_many tags

### tags table
| column | type | option |
| :---: | :---: | :----: |
| name | string | add_index :categories<BR> unique: true |

### categories table
| column | type | option |
| :---: | :---: | :----: |
| notes | string | null: false, unique: true |
| chords | string | null: false, unique: true |
| tasks | string | null: false, unique: true |

#### association
- has_many notes

### groups table
| column | type | option |
| :---: | :---: | :----: |
| name | string | null: false, unique: true |

### association
- has_many notes

### note_tags table
| column | type | option |
| :---: | :---: | :----: |
| note_id | references | null: false<BR> foreign_key: true |
| tag_id | references | null: false<BR>foreign_key: true |
#### association
- belongs_to :notes
- belongs_to :tags