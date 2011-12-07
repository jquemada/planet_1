class PlanetController < ApplicationController
  def index
  end

  def contact
  end

# GET /planet/ejemplo
  def ejemplo
  end

  def author
    @authors = [
	  # FIXME: Non-ascii characters raise an error
	  {:name		=>	"Leo Goffic",
	   :address		=>	"Calle de Linneo 26 Bajo B, Madrid, SPAIN",
	   :email		=>	"leo.goffic@gmail.com",
	   :curriculum	=>  "Erasmus student at UPM",
	   :image 		=>	nil
	  },
	  {:name		=>	"Miguel Revolo",
	   :address		=>  "Madrid, SPAIN",
	   :email		=>  "miguel.revolo@gmail.com",
	   :curriculum	=>	"Erasmus student at UPM"
	  }
	]
  end
end
