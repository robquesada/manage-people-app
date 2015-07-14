class PeopleControllerTest < ActionController::TestCase
  test "should get #new" do
    get :new, id: create(:person)
    assert_not_nil assigns(:person)
    assert_response :success
  end

  test "should get #show" do
    get :show, id: create(:person)
    assert_not_nil assigns(:person)
    assert_response :success
  end

  test "should get #edit" do
    get :edit, id: create(:person)
    assert_not_nil assigns(:person)
    assert_response :success
  end

  test "should #destroy person" do
    person = create(:person)
    assert_difference('Person.count', -1) do
      delete :destroy, id: person.id
    end
  end

  test "should #update person" do
    @person = create(:person)
    patch :update, id: @person, person: { first_name: @person.first_name }
    assert_redirected_to person_path(assigns(:person))
  end
end
