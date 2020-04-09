module ApplicationHelper
  require "coderay"
  require "redcarpet"

  
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
        language = language.split(':')[0]

        case language.to_s
        when 'rb'
            lang = 'ruby'
        when 'yml'
            lang = 'yaml'
        when 'css'
            lang = 'css'
        when 'html'
            lang = 'html'
        when ''
            lang = 'md'
        else
            lang = language
        end

        CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
end

    def markdown_id
        @markdown_id = current_user.memos.where(category_id: "1")
    end

    def chordpro_id
        @chordpro_id = current_user.memos.where(category_id: "2")
    end

    def memos
        @memos = Memo.all.recent
    end


    def user_id
        @user = current_user.id
    end

    def count
        @count = @memos.count
        if params[:search]
            case @count
            when 0 then
                '<i class="far fa-sad-tear fa-lg"></i> ' + "”#{params[:search]}” " + "一致する投稿はありません"
            else
                '<i class="far fa-laugh fa-lg"></i> ' + "”#{params[:search]}” " + "#{@count}件の結果"
            end
        elsif params[:tag_list]
            case @count
            when 0 then
                '<i class="far fa-sad-tear fa-lg"></i> ' + "”#{params[:search]}” " + "一致する投稿はありません"
            else
                '<i class="far fa-laugh fa-lg"></i> ' + "”#{params[:search]}” " + "#{@count}件の結果"
            end
        end
    end

    def nav_tags
        Memo.all
    end


end
