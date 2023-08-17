FactoryBot.define do
  factory :car_info do
    association :driver
    manufacturer_name { "ホンダ" }
    name { "シビックTypeR" }
    flame_number { "1234" }
    license_plate { "1234" }
    vehicle_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.png'), 'image/png') }
  end
end
