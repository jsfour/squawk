module Squwak

	class Ident < ActiveRecord::Base
		belongs_to :identable, polymorphic: true
		before_save :build_uuid
		validates :uuid, uniqueness: true

		def self.locate_identable uuid
			j = find_or_initialize_by(uuid: uuid)
			return j.identable unless j.identable.nil?
			false
		end

		def self.press_ident obj
			if !obj.ident.nil?
				raise "Object already has an identifier"
			else
				identifier = new
				identifier.identable = obj
				identifier.build_uuid
				identifier if identifier.save
			end
			false
		end

		def build_uuid
			self.uuid = new_uuid
			build_uuid if !valid?
			return self.uuid
		end
		#alias_method :set_uuid, :build_uuid

	private
		def new_uuid
			SecureRandom.uuid
		end

	end
end
