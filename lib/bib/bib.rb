module Bib
	
  	class Ref

		attr_accessor :autores, :titulo, :serie, :editorial, :numEdicion, :fecha, :numISBN
		
		def initialize(a,b,c,d,e,f,g)
			@autores = a
			@titulo = b
			@serie = c 
			@editorial = d
			@numEdicion = e
			@fecha = f
			@numISBN = g
		end

		def to_s
			"#{autores.join(", ")}.\n#{titulo}\n(#{serie})\n#{editorial}; #{numEdicion} edicion #{fecha}\n#{numISBN.join("\n")}"
		end
	end
	
	class Journal < Ref
		def initialize(a,b,c,d,e,f,g)
			super(a,b,c,d,e,f,g)
		end
	end
	
	class Book < Ref
		def initialize(a,b,c,d,e,f,g)
			super(a,b,c,d,e,f,g)
		end
	end
	
	class Magazine < Journal
		def initialize(a,b,c,d,e,f,g)
			super(a,b,c,d,e,f,g)
		end
	end
	
	class Newspaper < Journal
		def initialize(a,b,c,d,e,f,g)
			super(a,b,c,d,e,f,g)
		end
	end
	
	class Digital < Journal
		def initialize(a,b,c,d,e,f,g)
			super(a,b,c,d,e,f,g)
		end
	end
	
	class List
		
    	Node = Struct.new(:value, :prev, :next)
    	
		attr_accessor :head, :tail
		
		def initialize(ref)
			@head = Node.new(ref, nil, nil)
			@tail = nil
		end
		
		def add (ref)
			if ref.instance_of? Book and Journal
				if @head == nil
					@head = Node.new(ref, nil, nil)
					@tail = nil
				else
					if @tail == nil
						@tail = Node.new(ref, @head, nil)
						@head.next = @tail
					else
						aux = @tail
						@tail = Node.new(ref, aux, nil)
						aux.next = @tail
					end
				end
			elsif ref.instance_of? Array
				ref.each do |i|
					self.add(i)
				end
			else 
				raise "Error en el parametro de add"
			end
		end
		
		def subtract
			x = self.head
			@head = x.next
			if @head.next == nil
				@tail = nil
			end
			return x.value
		end
	end
end


