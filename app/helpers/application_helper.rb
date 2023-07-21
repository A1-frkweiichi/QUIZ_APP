module ApplicationHelper
  def default_meta_tags
    {
      site: "KnowledgeTreeQuiz",
      title: "KnowledgeTreeQuiz",
      reverse: true,
      charset: "utf-8",
      description: "エンジニア学習における知識を、クイズ形式で投稿＆回答して学べるサービスです",
      keywords: "KnowledgeTreeQuiz, みんなで育てる知識の木",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("ogp.png"),
        locale: "ja_JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "@KnowledgeTreeQuiz",
        image: image_url("ogp.png")
      }
    }
  end

  # Redcarpetのgemを使って、Markdown記法をHTMLに変換する
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(":")[0]

      lang = case language.to_s
             when "rb"
               "ruby"
             when "yml"
               "yaml"
             when "css"
               "css"
             when "html"
               "html"
             when ""
               "md"
             else
               language
             end

      CodeRay.scan(code, lang).div
    end
  end

  # マークダウン記法で表示する
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
      strikethrough: true,
      escape_html: true, # xss対策 全てのHTMLタグをエスケープ(filter_htmlより優先)
      quote: true # xss対策 引用符を表す「""」を認識
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
