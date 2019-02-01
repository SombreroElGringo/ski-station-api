require 'nokogiri'
require 'open-uri'

class ScraperService
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get_stations_from_html()
    puts "Scraping #{url}..."
    data = data_scraper(url)

    array_stations = []
    massif = data.css(IDENTIFIER[:massif]).first.content.downcase
    data.css(IDENTIFIER[:stations]).each_with_index do |station, index|
      # Get the url of the station
      station_url = station.css("a").first["href"]
      station_data = get_station_data(station_url, massif)
      array_stations.push(station_data)
    end

    array_stations.each do |station|
      puts "Inserting #{station[:code]} in DB"
      Station.create(massif: station[:massif], code: station[:code], name: station[:name], description: station[:description], state: station[:state], altitude: station[:altitude], opening: station[:opening], partial_opening: station[:partial_opening], snowpark: station[:snowpark], images: station[:images], styles: station[:styles], contact: station[:contact], domains: station[:domains], snowfall: station[:snowfall], open_domains: station[:open_domains], ski_pass: station[:ski_pass], weather: station[:weather])
    end

    puts array_stations
  rescue
    false
  end

  private

  def get_station_data(url, massif)
    puts "Scraping station with url = #{url}..."
    data = data_scraper(url)

    station_name = data.css("h1").first.content
    station_code = station_name.downcase.gsub(" ", STATION_CODE_SEPARATOR).gsub("'", STATION_CODE_SEPARATOR)

    station_images = get_station_images(data)
    station_styles = get_station_styles(data)
    station_contact = get_station_contact(data)
    station_description = get_station_description(data)
    station_state = get_station_state(data)
    station_altitude = get_station_altitude(data)
    station_opening = get_station_opening(data)
    station_partial_opening = get_station_partial_opening(data)
    station_domains = get_station_domains(data, false)
    station_snowfall = get_station_snowfall(data)
    station_open_domains = get_station_domains(data, true)
    station_ski_pass = get_station_ski_pass(data)
    station_snowpark = get_station_snowpark(data)
    station_weather = get_station_weather(data)

    station = {
      massif: massif,
      code: station_code,
      name: station_name,
      images: station_images,
      styles: station_styles,
      contact: station_contact,
      description: station_description,
      state: station_state,
      altitude: station_altitude,
      opening: station_opening,
      partial_opening: station_partial_opening,
      domains: station_domains,
      snowfall: station_snowfall,
      open_domains: station_open_domains,
      ski_pass: station_ski_pass,
      snowpark: station_snowpark,
      weather: station_weather,
    }

    return station
  rescue
    false
  end

  def get_station_images(data)
    station_images = []
    data.css(IDENTIFIER[:station_carousel]).each do |image|
      station_images.push(
        FRANCE_MONTAGNES_URL + image["src"].gsub(REGEX_CLEAN_IMG_URL, "")
      )
    end
    return station_images
  end

  def get_station_styles(data)
    station_styles = []
    data.css(IDENTIFIER[:station_styles]).each do |style|
      station_styles.push(
        style["title"].downcase
      )
    end
    return station_styles
  end

  def get_station_contact(data)
    station_contact_address_data = data.css(IDENTIFIER[:station_contact_address])
    station_contact_address = station_contact_address_data.first ?
      station_contact_address_data.first.content.gsub("\n ", "").gsub("              ", " ").gsub("            ", "")  : nil

    station_contact_phone_data = data.css(IDENTIFIER[:station_contact_phone])
    station_contact_phone = station_contact_phone_data.first ?
      station_contact_phone_data.first.content.gsub("Tél", "") : nil

    return {
      address: station_contact_address,
      phone: station_contact_phone,
    }
  end

  def get_station_description(data)
    station_description_data = data.css(IDENTIFIER[:station_description])
    return station_description_data.first ? station_description_data.first.content : nil
  end

  def get_station_state(data)
    station_state_data = data.css(IDENTIFIER[:station_state])
    return station_state_data.first ? station_state_data.first.content : nil
  end

  def get_station_altitude(data)
    station_altitude_data = data.css(IDENTIFIER[:station_altitude])
    return station_altitude_data.first ? station_altitude_data.first.content : nil
  end

  def get_station_opening(data)
    station_opening_data = data.css(IDENTIFIER[:station_opening])
    return station_opening_data.first ? station_opening_data.first.content : nil
  end

  def get_station_partial_opening(data)
    station_partial_opening_data = data.css(IDENTIFIER[:station_partial_opening])
    return station_partial_opening_data.first ? station_partial_opening_data.first.content : nil
  end

  def get_station_domains(data, open)
    info_id = open ? IDENTIFIER[:station_open_domains_info] : IDENTIFIER[:station_domains_info]
    green_id = open ? IDENTIFIER[:station_open_domains_green] : IDENTIFIER[:station_domains_green]
    blue_id = open ? IDENTIFIER[:station_open_domains_blue] : IDENTIFIER[:station_domains_blue]
    red_id = open ? IDENTIFIER[:station_open_domains_red] : IDENTIFIER[:station_domains_red]
    black_id = open ? IDENTIFIER[:station_open_domains_black] : IDENTIFIER[:station_domains_black]

    station_domains_info_data = data.css(info_id)
    station_domains_info = station_domains_info_data.first ?
      station_domains_info_data.first.content : nil

    station_domains_green_data = data.css(green_id)
    match_station_domains_green = get_number_of_domains(station_domains_green_data)
    station_domains_green = match_station_domains_green ? match_station_domains_green[0].to_i : 0

    station_domains_blue_data = data.css(blue_id)
    match_station_domains_blue = get_number_of_domains(station_domains_blue_data)
    station_domains_blue = match_station_domains_blue ? match_station_domains_blue[0].to_i : 0

    station_domains_red_data = data.css(red_id)
    match_station_domains_red = get_number_of_domains(station_domains_red_data)
    station_domains_red = match_station_domains_red ? match_station_domains_red[0].to_i : 0

    station_domains_black_data = data.css(black_id)
    match_station_domains_black = get_number_of_domains(station_domains_black_data)
    station_domains_black = match_station_domains_black ? match_station_domains_black[0].to_i : 0

    return {
      info: station_domains_info,
      green: station_domains_green,
      blue: station_domains_blue,
      red: station_domains_red,
      black: station_domains_black,
    }
  end

  def get_number_of_domains(data)
    return data.first ? data.first.content.match(REGEX_NUMBER) : nil
  end

  def get_station_snowfall(data)
    station_snowfall_bottom_data = data.css(IDENTIFIER[:station_snowfall])
    station_snowfall_bottom = station_snowfall_bottom_data.first ?
      station_snowfall_bottom_data.first.content : nil

    station_snowfall_top_data = data.css(IDENTIFIER[:station_snowfall])
    station_snowfall_top = station_snowfall_top_data.last ?
      station_snowfall_top_data.last.content : nil

    return {
      top: station_snowfall_top,
      bottom: station_snowfall_bottom,
    }
  end

  def get_station_ski_pass(data)
    station_ski_pass_day_data = data.css(IDENTIFIER[:station_ski_pass])
    station_ski_pass_day = !station_ski_pass_day_data.first ?
      nil : station_ski_pass_day_data.first.content == "-" ?
        nil : station_ski_pass_day_data.first.content

    station_ski_pass_week_data = data.css(IDENTIFIER[:station_ski_pass])
    station_ski_pass_week = !station_ski_pass_week_data.first ?
      nil : station_ski_pass_week_data.first.content == "-" ?
        nil : station_ski_pass_week_data.first.content

    return {
      day: station_ski_pass_day,
      week: station_ski_pass_week,
    }
  end

  def get_station_snowpark(data)
    station_ski_pass_data = data.css(IDENTIFIER[:station_snowpark])
    match_station_snowpark = station_ski_pass_data.first ? station_ski_pass_data.first.content.match(/^([0-9]+)/m) : nil
    return match_station_snowpark ? match_station_snowpark[0].to_i : 0
  end

  def get_station_weather(data)
    station_weather_state_data = data.css(IDENTIFIER[:station_weather_state])
    station_weather_state = station_weather_state_data.first ?
    station_weather_state_data.first["title"] : nil

    station_weather_morning_degree_data = data.css(IDENTIFIER[:station_weather_morning_degree])
    station_weather_morning_degree = station_weather_morning_degree_data.first ?
      station_weather_morning_degree_data.first.content : nil

    station_weather_afternoon_degree_data = data.css(IDENTIFIER[:station_weather_afternoon_degree])
    station_weather_afternoon_degree = station_weather_afternoon_degree_data.first ?
      station_weather_afternoon_degree_data.first.content : nil

    return {
      state: station_weather_state,
      morning: station_weather_morning_degree,
      afternoon: station_weather_afternoon_degree,
    }
  end

  def data_scraper(url)
    Nokogiri::HTML(open(url))
  end

end
