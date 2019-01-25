Station.create(
  code: "champ-du-feu",
  name: "CHAMP DU FEU",
  description: "Non loin de Strasbourg, le Champ du Feu dispose d'un domaine de ski alpin, ainsi que d'un domaine de ski de fond (gratuit), randonnées raquettes, luge, chiens de traîneau, randonnées pédestres....",
  state: "Domaine skiable ouvert",
  altitude: "900 m.",
  opening: "Du 22/12/2018 au 10/03/2019",
  partial_opening: "Du 22/12/2018 au 10/03/2019",
  snowpark: "1 Snowpark",
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
    green: "5 pistes vertes",
    blue: "4 pistes bleues",
    red: "4 pistes rouges",
    black: "0 pistes noires"
  },
  snowfall: {
    top: "25cm à 1099m",
    bottom: "25cm à 900m"
  },
  open_domains: {
    info: "6 pistes sur 13",
    green: "3 pistes vertes",
    blue: "2 pistes bleues",
    red: "1 pistes rouges",
    black: "0 pistes noires"
  },
  ski_pass: {
    day: "20,5 €",
    week: "140 €"
  },
  weather: {
    state: "Couvert",
    morning: "Matin -9°",
    afternoon: "Après-midi -8°"
  }
)

Station.create(
  code: "gerardmer",
  name: "GERARDMER",
  description: "Au cœur des Hautes-Vosges, carrefour entre la Lorraine et l'Alsace, Gérardmer, pays des lacs, des forêts et des montagnes, n'a pas fini de vous étonner !",
  state: "Domaine skiable ouvert",
  altitude: "850 m.",
  opening: "Du 22/12/2018 au 24/03/2019",
  partial_opening: "Le 22/12/2018",
  snowpark: "1 Snowpark",
  styles: ["stations nouvelles glisses", "sites nordiques", "montagne aventure", "montagne douce"],
  contact: {
    address: "OTI DES HAUTES-VOSGES GERARDMER 4 Place des Déportés 88401 - GERARDMER",
    phone: "03 29 27 27 27"
  },
  domains: {
    info: "40 km de pistes",
    green: "8 pistes vertes",
    blue: "3 pistes bleues",
    red: "8 pistes rouges",
    black: "2 pistes noires"
  },
  snowfall: {
    top: "65cm à 1140m",
    bottom: "20cm à 750m"
  },
  open_domains: {
    info: "21 pistes sur 21",
    green: "8 pistes vertes",
    blue: "3 pistes bleues",
    red: "8 pistes rouges",
    black: "2pistes noires"
  },
  ski_pass: {
    day: "27,5 €",
    week: "125,5 €"
  },
  weather: {
    state: "Couvert",
    morning: "Matin -5°",
    afternoon: "Après-midi -3°"
  }
)
