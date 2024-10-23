
require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:teacher) { create(:teacher) }
  let(:student) { create(:student) }

  before do
    sign_in teacher
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:students)).to eq(Student.page(1).per(10))
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new student" do
        expect {
          post :create, params: { student: attributes_for(:student) }
        }.to change(Student, :count).by(1)

        expect(flash[:success]).to eq("Student added successfully.")
        expect(response).to redirect_to(students_path)
      end

      it "updates an existing student if found" do
        existing_student = create(:student, name: "John Doe", subject: "Math", marks: 50)

        post :create, params: { student: { name: "John Doe", subject: "Math", marks: 75 } }
        existing_student.reload

        expect(existing_student.marks).to eq(75)
        expect(flash[:success]).to eq("Student marks updated successfully.")
        expect(response).to redirect_to(students_path)
      end
    end

    context "with invalid params" do
      it "does not create a student and renders new template" do
        post :create, params: { student: { name: "", subject: "", marks: "" } }
        expect(flash.now[:error]).to eq("There was an error saving the student. Please check your input.")
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: student.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: "New Name", subject: "Science", marks: 85 } }

      it "updates the requested student" do
        put :update, params: { id: student.to_param, student: new_attributes }
        student.reload
        expect(student.name).to eq("New Name")
        expect(student.subject).to eq("Science")
        expect(student.marks).to eq(85)
      end

      it "renders success JSON" do
        put :update, params: { id: student.to_param, student: new_attributes }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["success"]).to eq(true)
        expect(parsed_response["message"]).to eq("Student updated successfully.")
      end
    end

    context "with invalid params" do
      it "renders error JSON" do
        put :update, params: { id: student.to_param, student: { marks: nil } }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["success"]).to eq(false)
        expect(parsed_response["message"]).to include("Marks can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student" do
      student = create(:student)
      expect {
        delete :destroy, params: { id: student.to_param }
      }.to change(Student, :count).by(-1)

      expect(flash[:success]).to eq("Student deleted successfully.")
      expect(response).to redirect_to(students_path)
    end
  end
end
