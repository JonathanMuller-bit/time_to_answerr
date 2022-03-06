class StudentsControllerController < ApplicationController
    before_action :authenticate_student!
    layout 'students_backoffice'

end
