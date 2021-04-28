class TransformerController < ApplicationController
    get "/transformers" do 
        @transformers = Transformer.all 
        erb :"transformers/view"
    end
    get "/transformers/new" do 
        erb :"/transformers/new"
    end
    post "/transformers" do 
        @transformer = Transformer.new(:name => params[:name], :alternate_form => params[:alternate_form], :team => params[:team])
        @transformer.user_id = current_user.id 
        @transformer.save
        redirect "/transformers/#{@transformer.id}"
    end
    get "/transformers/:id" do 
        @transformer = Transformer.find_by_id(params[:id])
        erb :"/transformers/show"
    end

    get "/transformers/:id/edit" do 
        @transformer = Transformer.find_by_id(params[:id])
        if @transformer.user_id == current_user.id 
            erb :"/transformers/edit"
        else
            erb :"/transformers/denied"
        end
    end

    patch "/transformers/:id" do 
        @transformer = Transformer.find_by_id(params[:id])
        @transformer.name = params[:name]
        @transformer.alternate_form = params[:alternate_form]
        @transformer.team = params[:team]
        @transformer.save 
        redirect "/transformers/#{@transformer.id}"
    end

    delete "/transformers/:id" do 
        
        @transformer = Transformer.find_by_id(params[:id])
        if @transformer.user_id == current_user.id 
            @transformer.delete 
            redirect "/transformers"
        else
            erb :"/transformers/denied"
        end
    end

    

end