require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BorrowersController do

  # This should return the minimal set of attributes required to create a valid
  # Borrower. As you add validations to Borrower, be sure to
  # update the return value of this method accordingly.
  let(:valid_attributes) { FactoryGirl.attributes_for(:borrower) }

  describe "GET index" do
    it "assigns all borrowers as @borrowers" do
      borrower = Borrower.create! valid_attributes
      get :index, {}
      assigns(:borrowers).should eq([borrower])
    end
  end

  describe "GET show" do
    it "assigns the requested borrower as @borrower" do
      borrower = Borrower.create! valid_attributes
      get :show, {:id => borrower.to_param}
      assigns(:borrower).should eq(borrower)
    end
  end

  describe "GET new" do
    it "assigns a new borrower as @borrower" do
      get :new, {}
      assigns(:borrower).should be_a_new(Borrower)
    end
  end

  describe "GET edit" do
    it "assigns the requested borrower as @borrower" do
      borrower = Borrower.create! valid_attributes
      get :edit, {:id => borrower.to_param}
      assigns(:borrower).should eq(borrower)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Borrower" do
        expect {
          post :create, {:borrower => valid_attributes}
        }.to change(Borrower, :count).by(1)
      end

      it "assigns a newly created borrower as @borrower" do
        post :create, {:borrower => valid_attributes}
        assigns(:borrower).should be_a(Borrower)
        assigns(:borrower).should be_persisted
      end

      it "redirects to the created borrower" do
        post :create, {:borrower => valid_attributes}
        response.should redirect_to(Borrower.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved borrower as @borrower" do
        # Trigger the behavior that occurs when invalid params are submitted
        Borrower.any_instance.stub(:save).and_return(false)
        post :create, {:borrower => {}}
        assigns(:borrower).should be_a_new(Borrower)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Borrower.any_instance.stub(:save).and_return(false)
        post :create, {:borrower => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested borrower" do
        borrower = Borrower.create! valid_attributes
        # Assuming there are no other borrowers in the database, this
        # specifies that the Borrower created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Borrower.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => borrower.to_param, :borrower => {'these' => 'params'}}
      end

      it "assigns the requested borrower as @borrower" do
        borrower = Borrower.create! valid_attributes
        put :update, {:id => borrower.to_param, :borrower => valid_attributes}
        assigns(:borrower).should eq(borrower)
      end

      it "redirects to the borrower" do
        borrower = Borrower.create! valid_attributes
        put :update, {:id => borrower.to_param, :borrower => valid_attributes}
        response.should redirect_to(borrower)
      end
    end

    describe "with invalid params" do
      it "assigns the borrower as @borrower" do
        borrower = Borrower.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Borrower.any_instance.stub(:save).and_return(false)
        put :update, {:id => borrower.to_param, :borrower => {}}
        assigns(:borrower).should eq(borrower)
      end

      it "re-renders the 'edit' template" do
        borrower = Borrower.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Borrower.any_instance.stub(:save).and_return(false)
        put :update, {:id => borrower.to_param, :borrower => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested borrower" do
      borrower = Borrower.create! valid_attributes
      expect {
        delete :destroy, {:id => borrower.to_param}
      }.to change(Borrower, :count).by(-1)
    end

    it "redirects to the borrowers list" do
      borrower = Borrower.create! valid_attributes
      delete :destroy, {:id => borrower.to_param}
      response.should redirect_to(borrowers_url)
    end
  end

end
