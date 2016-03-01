class Admin::DepartmentsController < Admin::BaseController
  before_filter :admin_login_required 
  def index
    @admin = current_admin
    page = params[:page].blank? ? 1 : params[:page].to_i
    @departments = Department.paginate(:page => params[:page])
  end

  def new
    @admin = current_admin
    @department = Department.new
  end

  def create
    @department = Department.new departments_params
    if @department.save
      redirect_to [:admin, :departments]
    else
      render 'new'
    end
  end

  def edit
    @admin = current_admin
    @department = Department.find params[:id]
  end

  def update
    @department = Department.find params[:id]
    if @department.update_attributes departments_params
      redirect_to [:admin, :departments]
    else
      render 'edit'
    end
  end

  private
  def departments_params
    params.permit(:name)
  end

end