require 'csv'    

class Tools::FileLoader
    def initialize(file)
        @file = file
    end

    def read_file
        csv_text = File.read(@file)
        csv = CSV.parse(csv_text, :col_sep => ";", :headers => true )

        csv.each do |row|
            create_product(row)
        end

    end

    def create_product(row)
        p = Spree::Product.create!(
            name: row["name"],
            description: row["description"],
            available_on: row["availability_date"],
            slug: row["slug"],
            shipping_category: Spree::ShippingCategory.find_or_create_by(name: row["category"]),
            price: row["price"]
        )
    end

end