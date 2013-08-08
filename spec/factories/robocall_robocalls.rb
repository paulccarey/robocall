# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :robocall_robocall, :class => 'Robocall' do
    token "MyString"
    xml "MyText"
  end
end
