placeholder :count do
  match /more than (\d+)/ do |total|
    total.to_i + 1
  end

  match /at least one/ do
    1
  end

  match /no/ do
    0
  end

  match /\d+/ do |count|
    count.to_i
  end
end


placeholder :how_many do
  match /the first (\d+)/ do |total|
    total.to_i
  end

  match /each/ do
    nil
  end
end
