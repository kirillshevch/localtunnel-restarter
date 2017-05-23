module Localtunnel
  module Restarter
    class CLI
      def self.run
        options = { subdomain: default_subdomain, port: nil }

        parser = ::OptionParser.new do |opts|
          opts.on('-s', '--subdomain subdomain', 'Subdomain') do |subdomain|
            options[:subdomain] = subdomain;
          end

          opts.on('-p', '--port port', 'Port') do |port|
            options[:port] = port;
          end
        end

        parser.parse!

        launch_count = 0

        loop do
          launch_count += 1
          if options[:port]
            p "Running localtunnel for the #{ordinalize(launch_count)} time"
            p "Link: https://#{options[:subdomain]}.localtunnel.me/"
            `lt --port #{options[:port]} --subdomain #{options[:subdomain]}`
          else
            p 'Option --port is required'
            p 'Try to use something like this: localtunnel-restarter --port 9292'
            exit
          end
        end
      end

      def self.ordinal(number)
        abs_number = number.to_i.abs

        if (11..13).include?(abs_number % 100)
          'th'
        else
          case abs_number % 10
          when 1; 'st'
          when 2; 'nd'
          when 3; 'rd'
          else    'th'
          end
        end
      end

      def self.ordinalize(number)
        "#{number}#{ordinal(number)}"
      end

      def self.default_subdomain
        (('a'..'z').map { |s| s } + (0..9).map { |n| n }).shuffle.join[0..9]
      end
    end
  end
end
