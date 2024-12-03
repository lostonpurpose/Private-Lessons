require "uri"
require "net/http"
require "json"

class StudioFetcher
  def self.fetch_studiolist(start_time, end_time)
  # def self.fetch_studiolist
      # start_time -> "2024-12-07%2016:30"
      date = start_time.split.first.gsub("-", "%2F")
      start_time = start_time.split.last.gsub(":", "%3A")
      end_time = end_time.split.last.gsub(":", "%3A")

      p date
      p start_time
      p end_time

      url = URI("https://www.noahstudio.jp/noahweb/Webs/search/1/0/1")

      # Setup the HTTP connection
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      # Setup the POST request
      request = Net::HTTP::Post.new(url)
      request["accept"] = "application/json, text/javascript, */*; q=0.01"
      request["accept-language"] = "en-US,en;q=0.7"
      request["cache-control"] = "no-cache"
      request["content-type"] = "application/x-www-form-urlencoded; charset=UTF-8"
      request["cookie"] = "PHPSESSID=1dfada47a8b2e8009d49269315f965ae; AWSALB=VYUsRwFFEXCdTlh1IyTSMeis3MoGyhPeAERl0HJdGDWdjTFlEHXzyLDOo1vrkZf5RELfCj1Fu64Hhwah1ALhIEg8RH0EX3kBED9SBI7l/xVbFjLeLXKi2Hs8eaQz"
      request["referer"] = "https://www.noahstudio.jp/noahweb/webs/searchresults?searchdate=#{date}&start_time=#{start_time}&end_time=#{end_time}&is_all_branch=1&b%5B%5D=76&b%5B%5D=17&b%5B%5D=112&b%5B%5D=100&b%5B%5D=18&b%5B%5D=19&b%5B%5D=77&b%5B%5D=8&b%5B%5D=6&b%5B%5D=16&b%5B%5D=4&b%5B%5D=109&b%5B%5D=79&b%5B%5D=78&b%5B%5D=110&b%5B%5D=115"
      request["user-agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"

      # Form data (URL-encoded parameters)
      request.body = "searchdate=#{date}&start_time=#{start_time}&end_time=#{end_time}&is_all_branch=1&b%5B%5D=76&b%5B%5D=17&b%5B%5D=112&b%5B%5D=100&b%5B%5D=18&b%5B%5D=19&b%5B%5D=77&b%5B%5D=8&b%5B%5D=6&b%5B%5D=16&b%5B%5D=4&b%5B%5D=109&b%5B%5D=79&b%5B%5D=78&b%5B%5D=110&b%5B%5D=115"

      # request.body = "searchdate=2024%2F12%2F27&start_time=17%3A00&end_time=19%3A00&is_all_branch=1&b%5B%5D=76&b%5B%5D=17&b%5B%5D=112&b%5B%5D=100&b%5B%5D=18&b%5B%5D=19&b%5B%5D=77&b%5B%5D=8&b%5B%5D=6&b%5B%5D=16&b%5B%5D=4&b%5B%5D=109&b%5B%5D=79&b%5B%5D=78&b%5B%5D=110&b%5B%5D=115"

      begin
        response = https.request(request)

        # Check for a successful response
        if response.is_a?(Net::HTTPSuccess)
          # Parse JSON response and return the studiolist data
          parsed_data = JSON.parse(response.body)
          return parsed_data["studiolist"]
        else
          raise "Failed to fetch studiolist. HTTP Status: #{response.code}"
        end
      rescue => e
        # Handle errors (e.g., network issues, bad responses, JSON parsing errors)
        puts "Error fetching studiolist: #{e.message}"
        return nil
      end
    end
  end
  # Output the response (raw HTML or JSON)
  # puts response.body

  # parsed_data = JSON.parse(response.body)

  # json_string = parsed_data.to_json

  # data = JSON.parse(json_string)

  # Access specific fields:


  # data["studiolist"].map do |studio|
  #   p studio["m_stu"]["studio_name"]
  #   p studio["m_stu"]["size"]
  #   p studio["m_stu"]["image_path"]
  #   p studio["m_bra"]["web_branch_name"]
  #   p studio["0"]["price"]
  # end
