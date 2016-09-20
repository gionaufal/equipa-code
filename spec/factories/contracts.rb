FactoryGirl.define do
  factory :contract do
    customer
    acquisition_price 'MyString'
    delivery_address 'MyString'
    responsable 'MyString'
    cpf 'MyString'
    rental_period '15'
    initial_date '21/09/2016'
    amount 1.5
    discount 1.5
  end
end
