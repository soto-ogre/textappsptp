module MemoHelper
  def crdfile_find
    file_path = "spec/fixtures/#{@memo.id}.crd"
    if File.exist?(file_path)
      @content = Chordpro.html(File.read(file_path)).html_safe
      @content_title = Chordpro.html(File.read(file_path)).html_safe
    else
      @content = "<p>File not found<BR>ファイルが見つかりません<BR>新しく作り直してください。</p>".html_safe
    end
  end
end
