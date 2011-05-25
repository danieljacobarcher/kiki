# encoding: utf-8

module Kiki
  class Key
    attr_reader :namespace
    attr_accessor :delimiter, :domain, :identifier

    def initialize(namespace, delimiter, domain, identifier)
      @namespace = namespace
      @delimiter = delimiter
      @domain = domain
      @identifier = identifier
    end

    def for(*args)
      components = [@namespace, @domain] + args.collect do |arg|
        case arg
        when String, Numeric then arg
        else
          arg.respond_to?(@identifier) ? arg.send(@identifier) : arg.to_s
        end
      end

      components.compact.join(@delimiter)
    end
  end
end