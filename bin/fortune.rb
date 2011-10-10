#!/usr/bin/env ruby

class Fortune
        attr_accessor :text

        def initialize(t = nil)
                @text = t
        end

        def show
                puts @text
        end
end

class Fortunes
        attr_accessor :name, :list

        RE_BREAK = Regexp.compile(/\n%\n|^%\n/)
        
        def initialize(file = nil)
                return self if file.nil?

                check_file(file)

                texts = File.read(File.expand_path(file)).split(RE_BREAK)
                @list = texts.map {|e| Fortune.new(e) }
                @list.shift
                texts = nil

                @name = File.basename(file)
        end

        def add_file(file)
                check_file(file)

                if not(@list.kind_of?(Array))
                        @list = Array.new
                end

                texts = File.read(File.expand_path(file)).split(RE_BREAK)
                texts.shift
                texts.each {|e| @list << Fortune.new(e) }
                texts = nil

                if @name.nil?
                        @name = File.basename(file)
                else
                        @name = @name + " & " + File.basename(file)
                end
        end

        def show_rand
                @list[ rand(@list.count) ].show
        end
        def get_rand
                @list[ rand(@list.count) ].text
        end

        private
        def check_file(file)
                unless File.exists?(File.expand_path(file))
                        raise StandardError.new("#{File.expand_path(file)} does not exist")
                end
                #if File.open(file).read(1) != "%"
                #        raise StandardError.new("#{File.expand_path(file)} is not a fortune file")
                #end
        end
end


if __FILE__ == $PROGRAM_NAME
        @gui = false
	@default_dir = "/usr/share/games/fortunes"

        if ARGV.include?("-h")
                ARGV.delete("-h")
                STDERR.write("usage:\n  #{__FILE__} [-g] <fortune file(s)>\n\n\t-g\tTK Graphical display\n\n")
                exit(2)
        end

        if ARGV.include?("-g")
                ARGV.delete("-g")
                @gui = true
                require 'tk'

                root = TkRoot.new() { title "Fortune" }
        end

	files = []
        fortunes = Fortunes.new()

	if ARGV.count == 0
		for file in Dir.glob(@default_dir + "/*").reject {|i| i if i.end_with?(".dat") }
			puts file
               		fortunes.add_file(file)
		end
	end

        for item in ARGV
		if File.directory?(item)
			for file in Dir.glob(item + "/*")
				files << file if File.file?(file)
			end
		elsif File.file?(item)
			files << file
		else
			for file in Dir.glob(@default_dir + "/*").reject {|i| i if i.end_with?(".dat") }
				if File.basename(file) == item
                			fortunes.add_file(file)
				end
			end
		end
        end

	for file in files
                fortunes.add_file(file)
	end

	exit(-2) if fortunes.list.nil?

        if @gui
                msg = fortunes.get_rand()
                len = msg.split("\n").map {|e| e.length() }.sort().first()
                count = msg.split("\n").count

                tktext = TkText.new(root) { }.pack("side" => "left")
                tktext.insert('end', msg)

                Tk.mainloop()
        else
                fortunes.show_rand
        end

end
