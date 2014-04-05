# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  feed_id      :integer
#  user_id      :integer
#  title        :string(255)
#  author       :string(255)
#  url          :string(255)
#  summary      :text
#  content      :text
#  guid         :string(255)
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string(255)
#

class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :user_id, :feed_id, :title, :summary, :url, :content, :author,
                  :category_tokens, :published_at, :guid
  attr_reader :category_tokens

  belongs_to :user
  belongs_to :feed
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags

  validates :content, presence: true

  default_scope order: 'posts.published_at DESC'

  def category_tokens=(tokens)
    self.category_ids = Category.ids_from_tokens(tokens)
  end

  def self.update_from_feed(feed_url, feed_id)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries, feed_id)
  end
  
  def self.update_from_feed_continuously(feed_url, delay_interval = 15.minutes)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
    loop do
      sleep delay_interval
      feed = Feedjira::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
  end
  
  private
  
    def self.add_entries(entries, feed_id)
      entries.each do |entry|
        unless exists? guid: entry.id
          current = Category.all.map {|c| c.name}
          incoming = entry.categories.map!{|c| c.downcase.strip}
          (incoming - current).each do |tag|
            Category.create(name: tag)
          end
          create!(
            feed_id:            feed_id,
            title:              entry.title,
            content:            entry.content,
            summary:            entry.summary,
            url:                entry.url,
            published_at:       entry.published,
            guid:               entry.id,
            author:             entry.author,
            category_tokens:    Category.where("name IN (?)", incoming).map{|c| c.id}.join(',')
          )
        end
      end
    end

end
