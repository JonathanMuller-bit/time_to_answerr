class AdminsControllerController < ApplicationController
    before_action :authenticate_student!

    layout 'admins_backoffice'
end
