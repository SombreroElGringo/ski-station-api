FRANCE_MONTAGNES_URL = "https://www.france-montagnes.com"

MASSIF = [
  "#{FRANCE_MONTAGNES_URL}/massif/alpes-du-nord",
  "#{FRANCE_MONTAGNES_URL}/massif/alpes-du-sud",
  "#{FRANCE_MONTAGNES_URL}/massif/pyrenees",
  "#{FRANCE_MONTAGNES_URL}/massif/massif-central",
  "#{FRANCE_MONTAGNES_URL}/massif/jura",
  "#{FRANCE_MONTAGNES_URL}/massif/vosges",
  "#{FRANCE_MONTAGNES_URL}/massif/corse"
]

IDENTIFIER = {
  massif: "h1",
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

REGEX_NUMBER = /^([0-9]+)/m
