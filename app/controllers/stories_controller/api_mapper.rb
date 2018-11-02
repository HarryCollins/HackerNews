class StoriesController::ApiMapper

    def initialize
        map_to_model(get_story_ids(5))
    end

private

    def get_story_ids(num)
        open_client
        @client.top_stories[0..num-1]
    end

    def open_client
        @client = HN::Client.new
    end

    def map_to_model(story_ids)
        story_ids.each do |id|
            story_external = @client.item(id)
            story_internal = Story.new
            story_internal.attributes = {by: story_external.by, descendants: story_external.descendants, hnid: story_external.id, score: story_external.score, time: story_external.time, title: story_external.title, url: story_external.url}
            story_internal.save
            story_external.kids.each do |kid|
                comment_external = @client.item(kid)
                comment_internal = Comment.new
                comment_internal.attributes = {by: comment_external.by, hnid: comment_external.id, story_id: story_internal.id, text: comment_external.text, time: comment_external.time}
                comment_internal.save
            end
        end
    end

end
