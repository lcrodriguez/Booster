class Visitdetail < AccountScoped
  default_scope lambda { where(:account_id => Account.current) }
  
  belongs_to :visit
  belongs_to :material
  
  validates_presence_of :quantity, :on => :update
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0
  
  def self.maxrequest(request_id, material_id)
    logger.info 'request validation: ' + request_id.to_s
    @maximum = RequestItem.where({:request_id => request_id, :material_id => material_id}).first.quantity;
    if request_id.present? && material_id.present?
      @visits = scoped.where(:material_id => material_id)
      @visits = @visits.joins(:visit).where("visits" => {:request_id => request_id})
      @maximum = @maximum - @visits.sum(:quantity)
    end
    @maximum
  end
  
  validate :amount_is_not_exceeded
  
  def amount_is_not_exceeded
     errors.add_to_base I18n.translate("error_quantity_excedeed") if !quantity.blank? && quantity > Visitdetail.maxrequest(request_id, material_id)
  end  
  
  attr_accessor :request_id
end
