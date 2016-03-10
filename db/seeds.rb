User.create!([
  {
    name: 'Bob',
    password: 'password',
    password_confirmation: 'password'
  }, {
    name: 'John',
    password: 'password',
    password_confirmation: 'password'
  }, {
    name: 'Ann',
    password: 'password',
    password_confirmation: 'password'
  }
])

Room.create!([{
  name: 'Computer Games',
  memberships: [Membership.new(user: User.find_by(name: 'Bob'), room: Room.find_by(name: 'Computer Games')),
    Membership.new(user: User.find_by(name: 'John'), room: Room.find_by(name: 'Computer Games'))
  ]
}])

Room.create!([{
  name: 'Desktop Games',
  memberships: [Membership.new(user: User.find_by(name: 'Bob'), room: Room.find_by(name: 'Desktop Games')),
    Membership.new(user: User.find_by(name: 'John'), room: Room.find_by(name: 'Desktop Games')),
    Membership.new(user: User.find_by(name: 'Ann'), room: Room.find_by(name: 'Desktop Games'))
  ]
}])

Room.create!([{
  name: 'Card Games',
  memberships: [Membership.new(user: User.find_by(name: 'Bob'), room: Room.find_by(name: 'Card Games')),
    Membership.new(user: User.find_by(name: 'Ann'), room: Room.find_by(name: 'Card Games'))
    ]
}])

[{
  room: Room.find_by(name: 'Computer Games')
}, {
  room: Room.find_by(name: 'Desktop Games')
}, {
  room: Room.find_by(name: 'Card Games')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Bob')
    )
  end
end

[{
  room: Room.find_by(name: 'Computer Games')
}, {
  room: Room.find_by(name: 'Desktop Games')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'John')
    )
  end
end

[{
  room: Room.find_by(name: 'Desktop Games')
}, {
  room: Room.find_by(name: 'Card Games')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Ann')
    )
  end
end
