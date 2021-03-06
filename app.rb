require "./environment"

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end
    post "/pirates" do
      @ships = []
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      params[:pirate][:ships].each do |ship|
        @ships << Ship.new(ship[:name], ship[:type], ship[:booty], @pirate)
      end

      erb :"pirates/show"
    end
    # get "/pirates/:pirate" do
    #   @pirate_name = params[:pirate]
    #   @pirate = Pirate.all.find do |pirate|
    #     @pirate_name == pirate.name
    #   end
    #   binding.pry
    #   erb :"pirates/show"
    # end
  end
end
