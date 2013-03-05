module Jekyll
  module PostUrlFilter

    class PostComparer
      MATCHER = /^(.+\/)*(\d+-\d+-\d+)-(.*)$/

      attr_accessor :date, :slug

      def initialize(name)
        who, cares, date, slug = *name.match(MATCHER)
        @slug = slug
        @date = Time.parse(date)
      end
    end


    def post_url(post)

      @orig_post = post.strip
      @post = PostComparer.new(@orig_post)

      site = @context.registers[:site]

      site.posts.each do |p|
        if p.slug == @post.slug \
          and p.date.year == @post.date.year \
          and p.date.month == @post.date.month \
          and p.date.day == @post.date.day

          return p.url
        end
      end

      puts "ERROR: post_url: \"#{@orig_post}\" could not be found"

      return "#"

    end
  end
end

Liquid::Template.register_filter(Jekyll::PostUrlFilter)
