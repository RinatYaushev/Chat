User.create!([
  {
    email: 'bob@example.com',
    name: 'Bob',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380679876543',
    gender: 'man'
  }, {
    email: 'john@example.com',
    name: 'John',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380971234567',
    gender: 'man'
  }, {
    email: 'ann@example.com',
    name: 'Ann',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380681472583',
    gender: 'woman'
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
  3.times do
    Ping.create!(
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
  3.times do
    Ping.create!(
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
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Ann')
    )
  end
end

Product.create!([
  {
    name: 'Book',
    price: '100'
  }, {
    name: 'Table',
    price: '700'
  }, {
    name: 'Pen',
    price: '15'
  }
])

Purchase.create!([
  {
    user: User.find_by(name: 'Ann'),
    product: Product.find_by(name: 'Book'),
    quantity: '10',
    sum: '1000'
  }, {
    user: User.find_by(name: 'Ann'),
    product: Product.find_by(name: 'Table'),
    quantity: '2',
    sum: '1400'
  }, {
    user: User.find_by(name: 'Ann'),
    product: Product.find_by(name: 'Pen'),
    quantity: '25',
    sum: '375'
  }
])

Purchase.create!([
  {
    user: User.find_by(name: 'Bob'),
    product: Product.find_by(name: 'Book'),
    quantity: '100',
    sum: '10000'
  }, {
    user: User.find_by(name: 'Bob'),
    product: Product.find_by(name: 'Table'),
    quantity: '20',
    sum: '14000'
  }, {
    user: User.find_by(name: 'Bob'),
    product: Product.find_by(name: 'Pen'),
    quantity: '2500',
    sum: '37500'
  }
])

Comment.create!([
  {
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna.',
    user: User.find_by(name: 'Ann'),
    product: Product.find_by(name: 'Book')
  }, {
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna.',
    user: User.find_by(name: 'Ann'),
    product: Product.find_by(name: 'Book')
  }, {
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna.',
    user: User.find_by(name: 'Ann'),
    product: Product.find_by(name: 'Book')
  }
])
