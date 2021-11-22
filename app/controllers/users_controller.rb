class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]


    # REGISTER
    def create
        @user = User.create(user_params)
        if @user.valid? 
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

     # SHOW
     def show
        @user = User.find(params[:id])
        if @user 
            render json: {
                user: @user
            }
        else
            render json: {
                status: 500, 
                errors: ['user not found']
            }
        end
    end

    # LOGIN
    def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    # EDIT

    def edit
        @user = User.find(params[:id])
    end


        def update
            @user = User.find(params[:id])
    
            if @user && @user.authenticate(params[:password])
                token = encode_token({user_id: @user.id})
                @user.update(user_params)
                render json: {user: @user, token: token}
            else
                render json: {error: "Invalid username or password"}
            end
        end



    def auto_login
        render json: @user
    end

    private 

        def user_params
            params.permit(:username, :password, :email, :first_name, :last_name, :street_address, :city, :state, :zip, :phone, :avatar, :deed_in_need, :id )
        end
    end
