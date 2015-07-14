class PeopleController < ApplicationController
  before_filter :find_person, only: [:show, :edit, :update, :destroy]
  before_filter :find_genders, only: [:new, :edit]

  def index
    @people = Person.order(:first_name)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      send_email(@person, 'added')
      redirect_to person_path(@person)
    else
      flash.now[:error] = @person.errors.messages
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      flash.now[:error] = @person.errors.messages
      render 'edit'
    end
  end

  def destroy
    @person.delete
    send_email(@person, 'deleted')
    redirect_to people_path
  end

  private

  def find_genders
    @genders = ['Male', 'Female', 'Other']
  end

  def send_email(person, action)
    person_hash = { 'first_name' => @person.first_name,
                    'last_name' => @person.last_name }
    SendEmailJob.perform_later(person_hash, action)
  end

  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :job,
                                   :gender, :birthday, :picture, :bio)
  end
end
