class ComputadorPdf < Prawn::Document

	def initialize(computador, view)
		super()
		@computador = computador
		@view = view
		text "Computador #{@computador.id}"
	end

end