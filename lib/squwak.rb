require "squwak/engine"

module Squwak

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

  	def has_identifier
  		class_eval do
  			has_one(:ident, as: :identable, class_name: "Squwak::Ident", foreign_key: "identable_id")
        delegate :uuid, to: :ident
  			after_create do
  				Ident.press_ident self
  			end
  			#TODO: change this method's name to that people cant call it again.
  		end
  	end
    
  end

end
