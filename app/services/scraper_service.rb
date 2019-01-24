require 'nokogiri'
require 'open-uri'

IDENTIFIER = {
  stations: "div.block-station",
  station_carousel: "div.carousel-inner img",
  station_styles: "div.styles-station img.lazy",
  station_contact_address: "div#mb_renseignements address p",
  station_contact_phone: "div#mb_renseignements address div",
  station_description: "div#mb_station h2",
  station_state: "div#station_infos div.etat p",
  station_altitude: "div#station_infos div.altitude p",
  station_opening: "div#station_infos div.ouverture p",
  station_partial_opening: "div#station_infos div.ouverture-partielle p",
  station_domains_info: "div.alpin h4",
  station_domains_green: "div.alpin li.vert",
  station_domains_blue: "div.alpin li.bleu",
  station_domains_red: "div.alpin li.rouge",
  station_domains_black: "div.alpin li.noir",
  station_snowfall: "div.neige h4",
  station_open_domains_info: "div.pistes h4",
  station_open_domains_green: "div.pistes li.vert",
  station_open_domains_blue: "div.pistes li.bleu",
  station_open_domains_red: "div.pistes li.rouge",
  station_open_domains_black: "div.pistes li.noir",
  station_ski_pass: "div.forfait h4",
  station_snowpark: "div.nordic p.green",
  station_weather_state: "div.meteo i",
  station_weather_morning_degree: "div.meteo p.matin",
  station_weather_afternoon_degree: "div.meteo p.apresmidi"
}
STATION_CODE_SEPARATOR = "-"
REGEX_CLEAN_IMG_URL = /\?itok=.*/m

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
        if index == 0
          station_data = get_station_data(station_url)
        end

        #array_stations.push( station.content)
      end

      puts array_stations.length

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
      station_domains_green = data.css(IDENTIFIER[:station_domains_green]).first.content
      station_domains_blue = data.css(IDENTIFIER[:station_domains_blue]).first.content
      station_domains_red = data.css(IDENTIFIER[:station_domains_red]).first.content
      station_domains_black = data.css(IDENTIFIER[:station_domains_black]).first.content

      station_snowfall_bottom = data.css(IDENTIFIER[:station_snowfall]).first.content
      station_snowfall_top = data.css(IDENTIFIER[:station_snowfall]).last.content

      station_open_domains_info = data.css(IDENTIFIER[:station_open_domains_info]).first.content
      station_open_domains_green = data.css(IDENTIFIER[:station_open_domains_green]).first.content
      station_open_domains_blue = data.css(IDENTIFIER[:station_open_domains_blue]).first.content
      station_open_domains_red = data.css(IDENTIFIER[:station_open_domains_red]).first.content
      station_open_domains_black = data.css(IDENTIFIER[:station_open_domains_black]).first.content

      station_ski_pass_day = data.css(IDENTIFIER[:station_ski_pass]).first.content
      station_ski_pass_week = data.css(IDENTIFIER[:station_ski_pass]).last.content

      station_snowpark = data.css(IDENTIFIER[:station_snowpark]).first.content

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
      puts station
    rescue
      false
    end
  end

  def data_scraper(url)
    Nokogiri::HTML(open(url))
  end

end
