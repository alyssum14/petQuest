json.array!(@nutritions) do |nutrition|
  json.extract! nutrition, :id, :category, :foodname, :weight, :edible, :energy, :protein, :fat, :cho, :dietaryfiber, :ash, :cholesterol, :vitaminA, :retinol, :vitaminE, :vitaminB1, :vitaminB2, :vitaminB3, :calcium, :phoshorous, :potassium, :sodium, :magnesium, :iron, :zinc, :selenium, :copper, :manganese, :food_id
  json.url nutrition_url(nutrition, format: :json)
end
