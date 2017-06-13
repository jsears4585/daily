require 'rest-client'
require 'pry'
require 'json'

class DailiesController < ApplicationController

  def index
    results = RestClient.get( "https://en.wikipedia.org/api/rest_v1/feed/onthisday/all/#{current_month}/#{current_day}",
                              headers = { Accept: :'application/json' } )
    json = JSON.parse(results)
    @keep = keep_ary(json)
  end

  private

    def current_month
      m = Time.now.month
      m = "0" + m.to_s if m.to_s.length < 2
      m.to_s
    end

    def current_day
      d = Time.now.day
      d = "0" + d.to_s if d.to_s.length < 2
      d.to_s
    end

    def keep_ary json
      keep = json["events"].select do |event|
        !event["pages"].first["thumbnail"].nil?
      end
    end

end
