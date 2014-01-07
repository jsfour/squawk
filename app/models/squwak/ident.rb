module Squwak

	class Ident < ActiveRecord::Base
		belongs_to :identable, polymorphic: true
		before_save :build_uuid
		validates :uuid, uniqueness: true

		def build_uuid
			self.uuid = SecureRandom.uuid
			unless valid?
				build_uuid
			end
			true
		end

		def self.locate_identable uuid
			j = find_by_uuid(uuid)
			return j.identable unless j.nil?
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

	end

end
