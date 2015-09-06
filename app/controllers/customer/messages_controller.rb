class Customer::MessagesController < Customer::Base
  def new
    @message = Message.new
  end
end
