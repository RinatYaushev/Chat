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
