module ApplicationHelper

  def default_meta_tags
    {
      site: 'KnowledgeTreeQuiz',
      title: 'KnowledgeTreeQuiz',
      reverse: true,
      charset: 'utf-8',
      description: 'エンジニア学習における知識を、クイズ形式で投稿＆回答して学べるサービスです',
      keywords: 'KnowledgeTreeQuiz, みんなで育てる知識の木',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@KnowledgeTreeQuiz',
        image: image_url('ogp.png'),
      }
    }
  end
end
