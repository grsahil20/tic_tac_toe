class ArgumentsParser
  def initialize(arguments)
    @arguments = arguments
  end

  def build_options
    @options ||= parse_arguments
  end

  def parse_arguments
    options = {}
    opt_parser = OptionParser.new do |opts|
      options[:user] = 'User'
      opts.on("-u", "--user=NAME", "Name of user") do |name|
        options[:user] = name
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end
    opt_parser.parse!(ARGV)
    options
  end
end
