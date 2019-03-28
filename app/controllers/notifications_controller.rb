class NotificationsController < ApplicationController

  def send_notification
    @alert_message = "Enjoy your vacation!!"
    @user = User.find(params[:id])
    phone_number = @user.phone_number
      begin
        phone_number = @user.phone_number
        send_message(@phone_number, @alert_message)
        flash[:success] = "MESSAGE SENT!!"
      rescue
        flash[:alert] = "Nope"
      end
  end

  def index
  end

  def server_error
    raise 'A test exception'
  end

  private

    def send_message(phone_number, alert_message)

      @twilio_number = ENV['TWILIO_NUMBER']
      @user = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phone_number,
        :body => alert_message,
        # US phone numbers can make use of an image as well.
        # :media_url => image_url
      )
      puts message.to
    end

end
