module PostsHelper
  def parse_links(comment)
    auto_link(comment, html: {target: '_blank', class: 'link'}) do |text|
      URI.parse(text).host
    end
  end
end
