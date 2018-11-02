class StoriesController < ApplicationController

    #include ApiMapper
    def index
        ApiMapper.new
    end

private

    def get_stories(num)
        client = HN::Client.new
        story_ids = client.top_stories
        @story_array = Array.new
        story_ids[0..num-1].each do |id|
            @story_array << client.item(id)
        end
    end

end