require 'sinatra/base'

class FaxApp < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/faxes' do
    filename = params[:file][:filename]
    file = params[:file][:tempfile]
    to = params[:number]

    if file
      File.open("./files/#{filename}", 'wb') do |f|
        f.write(file.read)
      end

      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      client.fax.faxes.create(
        from: ENV['FROM_NUMBER'],
        to: to,
        media_url: "#{ENV["URL_BASE"]}/faxes/files/#{ERB::Util.url_encode(filename)}",
        status_callback: "#{ENV["URL_BASE"]}/faxes/status"
      )
    end
    redirect '/'
  end

  get '/faxes/files/:filename' do
    puts params[:filename]
    send_file "./files/#{params[:filename]}"
  end

  post '/faxes/status' do
    puts "===="
    puts "Fax SID:           #{params["FaxSid"]}"
    puts "To:                #{params["To"]}"
    puts "Remote Station ID: #{params["RemoteStationId"]}" if params["RemoteStationId"]
    puts "Status:            #{params["FaxStatus"]}"
    if params["ErrorCode"]
      puts "Error:             #{params["ErrorCode"]}"
      puts params["ErrorMessage"]
    end
    puts "===="
    200
  end
end
