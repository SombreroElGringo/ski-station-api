require 'nokogiri'
require 'open-uri'

class ScraperService
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get_stations_from_html()
    begin
      puts "Scraping #{url}..."
      data = data_scraper(url)

      array_stations = []
      data.css(IDENTIFIER[:stations]).each_with_index do |station, index|
        # Get the url of the station
        station_url = station.css("a").first["href"]
        if index == 0 || index == 0
          station_data = get_station_data(station_url)
          array_stations.push(station_data)
        end

      end

      puts array_stations

    rescue
      false
    end
  end

  private

  def get_station_data(url)
    begin
      puts "Scraping station with url = #{url}..."
      data = data_scraper(url)

      station_name = data.css("h1").first.content
      station_code = station_name.downcase.gsub(" ", STATION_CODE_SEPARATOR).gsub("'", STATION_CODE_SEPARATOR)

      station_images = []
      data.css(IDENTIFIER[:station_carousel]).each do |image|
        station_images.push(
          FRANCE_MONTAGNES_URL + image["src"].gsub(REGEX_CLEAN_IMG_URL, "")
        )
      end

      station_styles = []
      data.css(IDENTIFIER[:station_styles]).each do |style|
        station_styles.push(
          style["title"].downcase
        )
      end

      station_contact_address = data.css(IDENTIFIER[:station_contact_address]).first.content.gsub("\n ", "").gsub("              ", " ").gsub("            ", "")
      station_contact_phone = data.css(IDENTIFIER[:station_contact_phone]).first.content.gsub("Tél", "")

      station_description = data.css(IDENTIFIER[:station_description]).first.content

      station_state = data.css(IDENTIFIER[:station_state]).first.content

      station_altitude = data.css(IDENTIFIER[:station_altitude]).first.content
      station_opening = data.css(IDENTIFIER[:station_opening]).first.content
      station_partial_opening = data.css(IDENTIFIER[:station_partial_opening]).first.content

      station_domains_info = data.css(IDENTIFIER[:station_domains_info]).first.content
      match_station_domains_green = data.css(IDENTIFIER[:station_domains_green]).first.content.match(/^([0-9]+)/m)
      station_domains_green = match_station_domains_green[0].to_i
      match_station_domains_blue = data.css(IDENTIFIER[:station_domains_blue]).first.content.match(/^([0-9]+)/m)
      station_domains_blue = match_station_domains_blue[0].to_i
      match_station_domains_red = data.css(IDENTIFIER[:station_domains_red]).first.content.match(/^([0-9]+)/m)
      station_domains_red = match_station_domains_red[0].to_i
      match_station_domains_black = data.css(IDENTIFIER[:station_domains_black]).first.content.match(/^([0-9]+)/m)
      station_domains_black = match_station_domains_black[0].to_i

      station_snowfall_bottom = data.css(IDENTIFIER[:station_snowfall]).first.content
      station_snowfall_top = data.css(IDENTIFIER[:station_snowfall]).last.content

      station_open_domains_info = data.css(IDENTIFIER[:station_open_domains_info]).first.content
      match_station_open_domains_green = data.css(IDENTIFIER[:station_open_domains_green]).first.content.match(/^([0-9]+)/m)
      station_open_domains_green = match_station_open_domains_green[0].to_i
      match_station_open_domains_blue = data.css(IDENTIFIER[:station_open_domains_blue]).first.content.match(/^([0-9]+)/m)
      station_open_domains_blue = match_station_open_domains_blue[0].to_i
      match_station_open_domains_red = data.css(IDENTIFIER[:station_open_domains_red]).first.content.match(/^([0-9]+)/m)
      station_open_domains_red = match_station_open_domains_red[0].to_i
      match_station_open_domains_black = data.css(IDENTIFIER[:station_open_domains_black]).first.content.match(/^([0-9]+)/m)
      station_open_domains_black = match_station_open_domains_black[0].to_i

      station_ski_pass_day = data.css(IDENTIFIER[:station_ski_pass]).first.content
      station_ski_pass_week = data.css(IDENTIFIER[:station_ski_pass]).last.content

      match_station_snowpark = data.css(IDENTIFIER[:station_snowpark]).first.content.match(/^([0-9]+)/m)
      station_snowpark = match_station_snowpark[0].to_i

      station_weather_state = data.css(IDENTIFIER[:station_weather_state]).first["title"]
      station_weather_morning_degree = data.css(IDENTIFIER[:station_weather_morning_degree]).first.content
      station_weather_afternoon_degree = data.css(IDENTIFIER[:station_weather_afternoon_degree]).first.content

      station = {
        code: station_code,
        name: station_name,
        #images: station_images,
        styles: station_styles,
        contact: {
          address: station_contact_address,
          phone: station_contact_phone
        },
        description: station_description,
        state: station_state,
        altitude: station_altitude,
        opening: station_opening,
        partial_opening: station_partial_opening,
        domains: {
          info: station_domains_info,
          green: station_domains_green,
          blue: station_domains_blue,
          red: station_domains_red,
          black: station_domains_black
        },
        snowfall: {
          top: station_snowfall_top,
          bottom: station_snowfall_bottom
        },
        open_domains: {
          info: station_open_domains_info,
          green: station_open_domains_green,
          blue: station_open_domains_blue,
          red: station_open_domains_red,
          black: station_open_domains_black
        },
        ski_pass: {
          day: station_ski_pass_day,
          week: station_ski_pass_week,
        },
        snowpark: station_snowpark,
        weather: {
          state: station_weather_state,
          morning: station_weather_morning_degree,
          afternoon: station_weather_afternoon_degree
        }
      }
      return station
    rescue
      false
    end
  end

  def data_scraper(url)
    Nokogiri::HTML(open(url))
  end

end
