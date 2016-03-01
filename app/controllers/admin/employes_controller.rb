class Admin::EmployesController < Admin::BaseController
  before_filter :admin_login_required 
  def index
    @admin = current_admin
    page = params[:page].blank? ? 1 : params[:page].to_i
    @employes = Employe.paginate(:page => params[:page])
  end

  def new
    @admin = current_admin
    @employe = Employe.new
    @departments = Department.all
  end

  def create
    @employe = Employe.new employe_params
    if @employe.save
      redirect_to [:admin, :employes]
    else
      render 'new'
    end
  end

  def edit
    @admin = current_admin
    @employe = Employe.find params[:id]
    @departments = Department.all
  end

  def update
    @employe = Employe.find params[:id]
    if @employe.update_attributes employe_params
      redirect_to [:admin, :employes]
    else
      render 'edit'
    end
  end

  def destroy
    @employe = Employe.find params[:id]
    if @employe.destroy
      redirect_to [:admin, :employes]
    end
  end

  private
  def employe_params
    params.require(:employe).permit(:name, :year, :phone, :address, :role, :department_id)
  end

end