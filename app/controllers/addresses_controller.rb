class AddressesController < ApplicationController
    before_action :login_required

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

    def index
        addresses = current_user.addresses.map do |address|
            {id: address.id,
            name: address.name,
            country: address.country,
            state: address.state,
            zipcode: address.zipcode,
            city: address.city,
            streetAddress: address.street_address}
        end
        render json: {
            addresses: addresses
        }
    end

    private

    def address_params
        params.require(:address).permit(:name, :country, :state, :zipcode, :city, :street_address)
    end
end
