class Memo < ApplicationRecord
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  belongs_to :category
  has_many :favorites
  acts_as_taggable_on :labels
  



  scope :recent, -> { order(created_at: :asc) }


  def switch_for_each_category
    case self.category_id
    when 1 then
    when 2 then
      open("spec/fixtures/#{self.id}.crd", 'w'){|f|
        f.puts "#{self.content}"
      }
    end
  end

  def delete_switch_for_each_category
    case self.category_id
    when 1 then
    when 2 then
      FileUtils.rm("spec/fixtures/#{self.id}.crd")
    end
  end

  def self.search(search)
    return Memo.all unless search
    Memo.where(['content LIKE ? OR title LIKE ?', "%#{search}%","%#{search}%"])
  end

  def file_existence
    file_path = "spec/fixtures/#{self.id}.crd"
    if File.exist?(file_path)
      @content = Chordpro.html(File.read(file_path)).html_safe
    else
      @content = "<p>File not found<BR>ファイルが見つかりません<BR>新しく作り直してください。</p>".html_safe
    end
  end
end
