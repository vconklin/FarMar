# require_relative '../far_mar'

class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_sales = CSV.read("./support/sales.csv")
    # returns an array of instances with attributes created from a hash, representing all of the objects described in the CSV
    all_sales.collect do |sale|

      single_sale_hash = {
        id: sale[0],
        amount: sale[1],
        purchase_time: sale[2],
        vendor_id: sale[3],
        product_id: sale[4]
      }
      FarMar::Sale.new(single_sale_hash)
    end
  end

  def self.find(given_id)
    found_sale = nil
    self.all.each do |sale|
      if sale.id == given_id
        found_sale = sale
      end
    end
    found_sale
  end
end
