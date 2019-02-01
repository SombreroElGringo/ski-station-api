require 'rails_helper'

RSpec.describe Station, type: :model do
  subject {
    described_class.new(massif: "vosges",code: "gerardmer",name: "GERARDMER",description: "Au cœur des Hautes-Vosges, carrefour entre la Lorraine et l'Alsace, Gérardmer, pays des lacs, des forêts et des montagnes, n'a pas fini de vous étonner !",state: "Domaine skiable ouvert",altitude: "850 m.",opening: "Du 22/12/2018 au 24/03/2019",partial_opening: "Le 22/12/2018",snowpark: 1,images: ["https://www.france-montagnes.com/sites/default/files/styles/station_slideshow_thumb/public/station/hiver/neige-paysage-027.jpg"],styles: ["stations nouvelles glisses", "sites nordiques", "montagne aventure", "montagne douce"],contact: {address: "OTI DES HAUTES-VOSGES GERARDMER 4 Place des Déportés 88401 - GERARDMER",phone: "03 29 27 27 27"},domains: {info: "40 km de pistes",green: 8,blue: 3,red: 8,black: 2},snowfall: {top: "65cm à 1140m",bottom: "20cm à 750m"},open_domains: {info: "21 pistes sur 21",green: 8,blue: 3,red: 8,black: 2},ski_pass: {day: "27,5 €",week: "125,5 €"},weather: {state: "Couvert",morning: "Matin -5°",afternoon: "Après-midi -3°"})
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

end
