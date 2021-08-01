class UfsController < ApplicationController
  before_action :set_uf, only: [:show, :update, :destroy]

  # GET /ufs
  def index
    @ufs = Uf.pluck(:value, :date).map {|data| {value: data.first, date: data.second}} #selecciona los campos necesarios
    
    # respond_to do |format|
    #   format.json {render json: @uf}
    render json: @ufs
  end

  # GET /ufs/1
  def show

    user_code = request.headers["X-CLIENTE"]
    user = Client.find_by(code: user_code)
    return render json: "User not valid" unless user.present?
    return render json: "Error invalid field" unless @uf.present? #se valida que todos los parametros sean lo correctos para luego ejecutar seguir ejecutando el metodo
    UserRequest.create(date: Time.now, user_id: user.id )
    render json: { value: @uf.value, date: @uf.date}  # @uf.value es lo mismo que @uf[:value]
    
  end

  # POST /ufs
  def create
    @uf = Uf.new(uf_params)

    if @uf.save
      render json: @uf, status: :created, location: @uf
    else
      render json: @uf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ufs/1
  def update
    if @uf.update(uf_params)
      render json: @uf
    else
      render json: @uf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ufs/1
  def destroy
    @uf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uf
      @uf = Uf.find_by(date: params[:date])  #originalmente seria params [:id] , ya que el scaffold deja la ruta de show con el parametro :id, este lo cambiamos por :date desde routes
    end

    # Only allow a list of trusted parameters through.
    def uf_params
      params.require(:uf).permit(:value, :date)
    end
end
