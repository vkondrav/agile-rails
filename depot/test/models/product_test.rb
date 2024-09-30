require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "Title",
      description: "Description",
      image_url: "image.png",
    )

    product.price = -1

    assert product.invalid?

    assert_equal 1, product.errors.size
    assert_equal "must be greater than or equal to 0.01", product.errors[:price][0]

    product.price = 1

    assert product.valid?
  end

  test "image url" do
    ok = %w[ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif ]
    bad = %w[ fred.doc fred.gif/more fred.gif.more ]

    ok.each { |url|
      product = Product.new(
        title: "Title",
        description: "Description",
        price: 1,
        image_url: url,
      )

      assert product.valid?, "#{url} should be valid"
    }

    bad.each { |url|

      product = Product.new(
        title: "Title",
        description: "Description",
        price: 1,
        image_url: url,
      )

      assert product.invalid?, "#{url} should be valid"
    }
  end

  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:ruby).title,
      description: "yyy",
      price: 1,
      image_url: "fred.gif",
    )

    assert product.invalid?
    assert_equal 1, product.errors.size
    assert_equal I18n.translate("errors.messages.taken"), product.errors[:title][0]
  end
end
