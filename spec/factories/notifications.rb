FactoryBot.define do
  factory :notification do
    notifiable_type{"Alert"}
    action{"To All"}
    reciever_id{nil}
    user
  end
end
