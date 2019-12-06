5.times do
  @user = User.create(
    email: Faker::Internet.email,
    password: 'password'
  )
  3.times do
    @billboard = Billboard.create(
      name: Faker::Restaurant.name,
      user_id: @user.id
    )
    2.times do
      @artist = Artist.create(
        name: Faker::Food.fruits,
        rank: Faker::Number.within(range: 1..100),
        billboard_id: @billboard.id
      )
      2.times do 
        Song.create(
          title: Faker::Coffee.blend_name,
          album: Faker::DcComics.hero,
          artist_id: @artist.id
        )
      end
    end
  end

end