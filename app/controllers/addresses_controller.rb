class AddressesController < ApplicationController
    def create
        address = current_user.addresses.build(address_params)
        if address.save
            render json: {
                address: {
                    id: address.id,
                    name: address.name,
                    country: address.country,
                    state: address.state,
                    zipcode: address.zipcode,
                    city: address.city,
                    streetAddress: address.street_address
                }
            }
        else
            render json: {
                errors: address.errors.full_messages
            }
        end
    end

    private

    def address_params
        params.require(:address).permit(:name, :country, :state, :zipcode, :city, :street_address)
    end
end
