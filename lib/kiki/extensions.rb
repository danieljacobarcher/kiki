# encoding: utf-8

# Fallback to monkeypatch version of +String#pluralize+ if ActiveSupport Inflector (or another class) has not defined it already
unless String.respond_to? :pluralize
  String.class_eval do
    def pluralize
      self[(self.length - 1), 1] =~ /s/i ? self : "#{self}s"
    end
  end
end