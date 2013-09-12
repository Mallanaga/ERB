atom_feed language: 'en-US', schema_date: 2013 do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |post|
    next if post.updated_at.blank?
    feed.entry post, published: post.published_at do |entry|
      entry.title post.title
      entry.summary post.summary.blank? ? truncate("#{strip_tags(post.content)}", length: 140, separator: ' ') : strip_tags(post.summary)
      entry.content post.content, type: 'html'
      entry.link href: post_url(post)
      entry.author do |author|
        author.name post.user ? post.user.name : post.author
      end
      post.categories.map {|c| c.name}.each do |t|
        entry.category term: t, label: t, scheme: 'http://ecorebox.com'
      end
    end # end feed.entry
  end # end @posts.each
end