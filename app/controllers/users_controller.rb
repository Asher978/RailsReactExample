class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def show
        render json: User.find_by(id: params[:id])
    end

    def create
        user = User.new(name: params[:name],
                        quote: params[:quote])

        if user.valid?
            user.save
            render jaon: {status: 'create success', user: user}
        else
            render json: {status: 'Something went wrong'}
        end
    end

    def destroy
        User.destroy(params[:id])
        render json: {status: 'delete success'}
    end


    def update
        user = User.update(params[:id],
                           name: paras[:name],
                           quote: params[:quote])
        render json: {status: 'update success'}
    end

    def search 
        if params[:type] == 'name'
            result = User.where("name ILIKE ?", "%#{params[:query]}%")
        elsif params[:type] == 'quote'
            result = User.where("quote ILIKE ?", "%#{params[:query]}%")
        else
            result = "please provide a correct input"
        end

        render json: {users: result}
    end

end
