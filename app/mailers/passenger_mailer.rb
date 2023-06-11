class PassengerMailer < ApplicationMailer
    def confirmation_email(passenger)
        @passenger = passenger
        @booking = @passenger.booking
        @flight = @passenger.flight

        mail( to: @passenger.email )
    end
end
