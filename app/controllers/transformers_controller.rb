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
        @transformer.user_id
        @transformer.save
        redirect "/transformers/#{@transformer.id}"
    end
    get "/transformers/:id" do 
        @transformer = Transformer.find_by_id(params[:id])
        erb :"/transformers/show"
    end

    get "/transformers/:id/edit" do 
        @transformer = Transformer.find(params[:id])
        erb :"/transformers/edit"

end