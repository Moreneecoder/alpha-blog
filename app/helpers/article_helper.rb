module ArticleHelper
  def new_article_error(article)
    errors = article.errors
    if errors.any?
      concat(content_tag(:h5, "#{pluralize(errors.count, 'count')} errors occured!"))
      content_tag(:ul) do
        errors.full_messages.each do |msg|
        concat(content_tag(:li, msg))
        end
      end
    end
  end
end