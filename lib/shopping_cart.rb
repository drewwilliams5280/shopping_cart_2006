require './lib/product'

class ShoppingCart

  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {
      name: @name,
      capacity: @capacity.tr("items", "").to_i
    }
  end

  def quantity_to_integer
    @products.map do |product|
      product.quantity.to_i
    end
  end

  def total_number_of_products
    quantity_to_integer.inject(0) {|sum, i| sum + i}
  end

  def is_full?
    total_number_of_products > @capacity.tr("items", "").to_i
  end

  def products_by_category(category)
    @products.map do |product|
      if product.category == category
        return product
      end
      @products 
    end
  end

end
