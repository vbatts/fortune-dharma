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

        private
        def check_file(file)
                unless File.exists?(File.expand_path(file))
                        raise StandardError.new("#{File.expand_path(file)} does not exist")
                end
                if File.open(file).read(1) != "%"
                        raise StandardError.new("#{File.expand_path(file)} is not a fortune file")
                end
        end
end


if __FILE__ == $PROGRAM_NAME
        if ARGV.count == 0
                STDERR.write("ERROR: please specify a fortune file\n")
                exit(2)
        end

        fortunes = Fortunes.new()
        for file in ARGV
                fortunes.add_file(file)
        end
        fortunes.show_rand

end
