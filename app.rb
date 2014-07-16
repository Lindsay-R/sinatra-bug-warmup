require "sinatra"
require "active_record"
require "gschool_database_connection"
require "rack-flash"

class App < Sinatra::Base
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    erb :home
  end

  get "/register" do
    erb :register
  end

  post "/registrations" do

    #--------added elsif statement-------
    post "/registrations" do
      if params[:name_is_hunter] == "0"
        flash[:error] = "Please fill in all fields."
        redirect "/register"

      elsif  @database_connection.sql("SELECT * FROM users WHERE username = '#{params[:username].downcase}'") != []
        flash[:error] = "Username is already taken."
        redirect "/register"

      end

    #--------end elsif statement-------


    insert_sql = <<-SQL
      INSERT INTO users (username, email, password, name_is_hunter)
      VALUES ('#{params[:username]}', '#{params[:email]}', '#{params[:password]}', '#{params[:name_is_hunter]}')
    SQL

    puts "="*20
    puts insert_sql
    puts "="*20

    @database_connection.sql(insert_sql)
    flash[:notice] = "Thanks for signing up"

    redirect "/"
  end
end