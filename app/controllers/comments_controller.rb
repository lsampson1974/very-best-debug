class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.author_id = params.fetch("query_author_id")
    comment.venue_id = params.fetch("query_venue_id")
    comment.body = params.fetch("query_body")
    comment.save


    puts "TEST ->> #{comment.commenter}"

    if comment.valid?
      comment.save

      @the_venue = Venue.where({ :id => comment.venue_id }).first

      puts "THIS IS A TEST!!!! ->> #{comment.body}"

    end

    render({ :template => "venue_templates/details" })

  end
end
