Station.create(
  massif: "vosges",
  code: "champ-du-feu",
  name: "CHAMP DU FEU",
  description: "Non loin de Strasbourg, le Champ du Feu dispose d'un domaine de ski alpin, ainsi que d'un domaine de ski de fond (gratuit), randonnées raquettes, luge, chiens de traîneau, randonnées pédestres....",
  state: "Domaine skiable ouvert",
  altitude: "900 m.",
  opening: "Du 22/12/2018 au 10/03/2019",
  partial_opening: "Du 22/12/2018 au 10/03/2019",
  snowpark: 1,
  images: ["https://www.france-montagnes.com/sites/default/files/styles/station_slideshow_thumb/public/station/hiver/station-champ-du-feu--5-.JPG"],
  styles: [
    "sites nordiques",
    "stations villages de charme",
    "montagne douce",
    "étapes de montagne",
    "club"
  ],
  contact: {
    address: "Office de Tourisme de la Vallée de la Bruche 150, La Serva 67130 - CHAMP DU FEU",
    phone: "33 (0)3 88 97 39 50"
  },
  domains: {
    info: "5 km de pistes",
    green: 5,
    blue: 4,
    red: 4,
    black: 0
  },
  snowfall: {
    top: "25cm à 1099m",
    bottom: "25cm à 900m"
  },
  open_domains: {
    info: "6 pistes sur 13",
    green: 3,
    blue: 2,
    red: 1,
    black: 0
  },
  ski_pass: {
    day: "20,5 €",
    week: "140 €"
  },
  weather: {
    state: "Couvert",
    morning: "Matin -9°",
    afternoon: "Après-midi -8°"
  },
  onSpotlight: false
)

Station.create(
  massif: "vosges",
  code: "gerardmer",
  name: "GERARDMER",
  description: "Au cœur des Hautes-Vosges, carrefour entre la Lorraine et l'Alsace, Gérardmer, pays des lacs, des forêts et des montagnes, n'a pas fini de vous étonner !",
  state: "Domaine skiable ouvert",
  altitude: "850 m.",
  opening: "Du 22/12/2018 au 24/03/2019",
  partial_opening: "Le 22/12/2018",
  snowpark: 1,
  images: ["https://www.france-montagnes.com/sites/default/files/styles/station_slideshow_thumb/public/station/hiver/neige-paysage-027.jpg"],
  styles: ["stations nouvelles glisses", "sites nordiques", "montagne aventure", "montagne douce"],
  contact: {
    address: "OTI DES HAUTES-VOSGES GERARDMER 4 Place des Déportés 88401 - GERARDMER",
    phone: "03 29 27 27 27"
  },
  domains: {
    info: "40 km de pistes",
    green: 8,
    blue: 3,
    red: 8,
    black: 2
  },
  snowfall: {
    top: "65cm à 1140m",
    bottom: "20cm à 750m"
  },
  open_domains: {
    info: "21 pistes sur 21",
    green: 8,
    blue: 3,
    red: 8,
    black: 2
  },
  ski_pass: {
    day: "27,5 €",
    week: "125,5 €"
  },
  weather: {
    state: "Couvert",
    morning: "Matin -5°",
    afternoon: "Après-midi -3°"
  },
  onSpotlight: true
)
