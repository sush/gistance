module Gistance
  class Client
    # Methods for the Distance Matrix API
    #
    # @see https://developers.google.com/maps/documentation/distancematrix
    module DistanceMatrix
      # Calculate distances for a matrix of origins and destinations.
      # @param options [Hash] a customizable set of options
      # @option options [Hash] :origins an array of origins
      # @option options [Hash] :destinations an array of destination
      # @return [Hashie::Mash] the distance between origins and destinations
      # @see https://developers.google.com/maps/documentation/distancematrix/#DistanceMatrixRequests
      # @example
      #   Gistance.distance_matrix(
      #     origins: ["48.92088132,2.210950607"],
      #     destinations: ["48.922024,2.206292"]
      #   )
      def distance_matrix(options={})
        options[:origins] = format_locations_array(options[:origins])
        options[:destinations] = format_locations_array(options[:destinations])

        delete_status_from_response(get(options))
      end

      private

      def format_locations_array(locations)
        locations.map { |location| format_location(location) }.join('|')
      end

      def format_location(location)
        return location if location_is_coordinates?(location)

        location.split(' ').join('+')
      end

      def location_is_coordinates?(location)
        location.to_s =~ /^\s*-?\d+\.\d+\,\s?-?\d+\.\d+\s*$/
      end

      def delete_status_from_response(response)
        response.delete(:status)

        response.rows.each do |row|
          row['elements'].each { |el| el.delete(:status) }
        end

        response
      end
    end
  end
end
