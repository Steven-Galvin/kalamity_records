FactoryGirl.define do
  factory(:user) do
    username("Jaykal")
    admin(true)
    name("Factory")
    sex("Male")
    dob("1993-11-07 00:00:00 UTC")
    email("factory@factory.com")
    password("asdfas")
    password_confirmation("asdfas")
    id(4)
  end

  factory(:record) do
    title("Let's Sleep")
    artist("Sandman")
    album_length(40)
    genre("Alternative")
    price(14)
    description("Lorem ipsum sava tu esha klinta")
    id(90)
  end

  factory(:review) do
    content("Tilk fey aderif noder al kall ipsay tuke")
    rating(3)
    record_id(90)
    user_id(4)
  end
end
