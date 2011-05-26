# encoding: utf-8

require 'kiki/extensions'

module Kiki
  autoload :Key,        'kiki/key'
  autoload :Version,    'kiki/version'

  def self.included(klass)
    klass.class_eval { extend ClassMethods }
  end

  module ClassMethods
    def cache_key(namespace, options = {})
      class_eval(<<-EVAL, __FILE__, __LINE__)
        class << self
          @@#{namespace}_key = Key.new "#{namespace}",
                                       "#{options[:delimiter] || ":"}",
                                       "#{options[:domain] || self.name.downcase.pluralize}",
                                       :"#{options[:identifier] || :id}"

          def #{namespace}_key(*args)
            return args.empty? ? @@#{namespace}_key : @@#{namespace}_key.for(*args)
          end
        end

        def #{namespace}_key(*args)
          return self.class.#{namespace}_key(*[self, *args])
        end
      EVAL

      return self.send("#{namespace}_key")
    end
  end
end