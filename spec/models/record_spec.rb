require 'rails_helper'

describe Record do
  it {should validate_presence_of :title}
  it {should validate_presence_of :price}
  it {should validate_presence_of :description}
  it {should validate_presence_of :genre}
  it {should validate_presence_of :album_length}
  it {should validate_presence_of :artist}
end
