class WelcomeController < ApplicationController

def index
end

  def say
    render( :text => "Hello!!!" )
  end

end