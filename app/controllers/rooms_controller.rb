class RoomsController < ApplicationController
  load_and_authorize_resource except: [:redirect]
  skip_before_filter :authenticate_user!, only: [:show, :redirect]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
  end

  def create
    @room = current_user.rooms.create(params[:room])

    if @room.persisted?
      user = User.new(:email => "test2@rumulu.com", :first_name => "Stu", :last_name => "Lumaru")
      user.set_random_passwords
      user.save

      user.applications.create(answer_1: "I'd hang out for a few minutes and possibly have a glass of wine.",
                               answer_2: "I like Toby, because he's quiet, thoughtful, and always says what he means.",
                               answer_3: "I'm a Librarian, which is what I've always wanted to be.",
                               age: 29,
                               room_id: @room.id,
                               gender: "Male",
                               has_pets: false,
                               is_student: false,
                               comments: "I have two goldfish. I hope that's OK.")

      redirect_to edit_room_path(@room)
    else
      render :new
    end
  end

  def update
    @room = Room.find(params[:id])

    @room.update_attributes(params[:room])
    redirect_to edit_room_path(@room)
  end

  def images
    @room = Room.find(params[:id])
  end

  def redirect
    @room = Room.find_by_token(params[:token])
    redirect_to room_path(@room)
  end
end
