class ApplicationController < ActionController::API
    @user = nil
    @@status = Hash.new
    @@status[nil]='NULL';
    @@status[true]='true';
    @@status[false]='false';
    #uncomment below to add the words again
    #if using postgres then replace words.txt with words_p.txt
    def initialize
      if Word.all.length==0
        pokemon_file_path = File.join(File.dirname(__FILE__), "../texts/words_p.txt") 
        file = File.open(pokemon_file_path)
        file_data = file.read
        file_data.each_line do |line|
          ActiveRecord::Base.connection.execute(line)
        end
        file.close
      end
    end
  
    def restrict_access
      @user = User.find(request.headers["id"].to_i)
      unless @user&.authenticated?(request.headers["remember_token"])
        @user = nil
        render json: { "error": 'you must be logged to do this action' }, status: :unauthorized
      end
    end
end
