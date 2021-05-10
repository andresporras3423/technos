class ApplicationController < ActionController::API
    include ActionController::Cookies
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
    begin
      @user = User.find(cookies[:id])
    rescue => exception
      render json: { "error": 'you must be logged to do this action' }, status: :unauthorized
    end
  end
end
