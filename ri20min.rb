#!/user/bin/env ruby

class MegaGreeter
    attr_accessor :names

    # Create the object
    def initialize(names = "World")
        @names = names
    end

    #Say hi to everybody
    def say_hi
        if @names.nil?  #nilの場合（falseかnil)にtrueを返す=puts以下が実行される
            puts "..."
        elsif @names.respond_to?("each")
            #名簿かなんかに名前があるかチェック
            # @names is a list of some kind, iterate!
            @names.each do |name|
                puts "Hello" #{name}!
            end
        else
            puts "Hello #{@names}!"
        end
    end

    #Say bye to everybody
    def say_bye
        if @names.nil?
            puts "..."
        elsif @names.respond_to?("join")
            #Join the list elements with commas
            puts "Goodbye #{@names.join(", ")}. Come back soon!"
        else
            puts "Goodbye #{@names}. Come back soon!"
        end
    end
end

if __FILE__== $0
#__FILE__は実行中のファイルのファイル名、$0は実行時に指定されたファイル名
    mg = MegaGreeter.new
    mg.say_hi
    mg.say_bye

    #Change name to be "Zeke"
    mg.names = "zeke"
    mg.say_hi
    mg.say_bye

    #Change the name to an array of names
    mg.names = ["Albert", "Brenda", "Charles", "Dave", "Engelbert"]
    mg.say_hi
    mg.say_bye

    #Change to nil
    mg.names = nil
    mg.say_hi
    mg.say_bye
end
