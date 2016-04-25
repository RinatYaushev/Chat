User.create!([
  {
    email: 'ross@example.com',
    name: 'Ross',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380671234567',
    gender: 'man',
    roles: [:administrator, :moderator]
  }, {
    email: 'joey@example.com',
    name: 'Joey',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380979876543',
    gender: 'man',
    roles: [:moderator]
  }, {
    email: 'chandler@example.com',
    name: 'Chandler',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380731234567',
    gender: 'man'
  }, {
    email: 'rachel@example.com',
    name: 'Rachel',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380689876543',
    gender: 'woman'
  }, {
    email: 'phoebe@example.com',
    name: 'Phoebe',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380981234567',
    gender: 'woman'
  }, {
    email: 'monica@example.com',
    name: 'Monica',
    password: 'password',
    password_confirmation: 'password',
    phone: '+380939876543',
    gender: 'woman'
  }
])

Room.create!([{
  name: 'Boys',
  memberships: [Membership.new(user: User.find_by(name: 'Ross'), room: Room.find_by(name: 'Boys')),
    Membership.new(user: User.find_by(name: 'Joey'), room: Room.find_by(name: 'Boys')),
    Membership.new(user: User.find_by(name: 'Chandler'), room: Room.find_by(name: 'Boys'))
  ]
}])

Room.create!([{
  name: 'Girls',
  memberships: [Membership.new(user: User.find_by(name: 'Rachel'), room: Room.find_by(name: 'Girls')),
    Membership.new(user: User.find_by(name: 'Monica'), room: Room.find_by(name: 'Girls')),
    Membership.new(user: User.find_by(name: 'Phoebe'), room: Room.find_by(name: 'Girls'))
  ]
}])

Room.create!([{
  name: 'All',
  memberships: [Membership.new(user: User.find_by(name: 'Ross'), room: Room.find_by(name: 'All')),
    Membership.new(user: User.find_by(name: 'Joey'), room: Room.find_by(name: 'All')),
    Membership.new(user: User.find_by(name: 'Chandler'), room: Room.find_by(name: 'All')),
    Membership.new(user: User.find_by(name: 'Rachel'), room: Room.find_by(name: 'All')),
    Membership.new(user: User.find_by(name: 'Monica'), room: Room.find_by(name: 'All')),
    Membership.new(user: User.find_by(name: 'Phoebe'), room: Room.find_by(name: 'All'))
  ]
}])

Relationship.create!([
  {
    follower_id: User.find_by(name: 'Joey').id,
    followee_id: User.find_by(name: 'Ross').id
  }, {
    follower_id: User.find_by(name: 'Chandler').id,
    followee_id: User.find_by(name: 'Ross').id
  }, {
    follower_id: User.find_by(name: 'Rachel').id,
    followee_id: User.find_by(name: 'Ross').id
  }, {
    follower_id: User.find_by(name: 'Monica').id,
    followee_id: User.find_by(name: 'Ross').id
  }, {
    follower_id: User.find_by(name: 'Phoebe').id,
    followee_id: User.find_by(name: 'Ross').id
  }
])

[{
  room: Room.find_by(name: 'Boys')
}, {
  room: Room.find_by(name: 'All')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Ross')
    )
  end
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Ross')
    )
  end
end

[{
  room: Room.find_by(name: 'Boys')
}, {
  room: Room.find_by(name: 'All')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Chandler')
    )
  end
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Chandler')
    )
  end
end

[{
  room: Room.find_by(name: 'Boys')
}, {
  room: Room.find_by(name: 'All')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Joey')
    )
  end
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Joey')
    )
  end
end

[{
  room: Room.find_by(name: 'Girls')
}, {
  room: Room.find_by(name: 'All')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Rachel')
    )
  end
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Rachel')
    )
  end
end

[{
  room: Room.find_by(name: 'Girls')
}, {
  room: Room.find_by(name: 'All')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Monica')
    )
  end
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Monica')
    )
  end
end

[{
  room: Room.find_by(name: 'Girls')
}, {
  room: Room.find_by(name: 'All')
}].each do |info|
  5.times do
    Message.create!(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna.',
      room: info[:room],
      user: User.find_by(name: 'Phoebe')
    )
  end
  3.times do
    Ping.create!(
      room: info[:room],
      user: User.find_by(name: 'Phoebe')
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
    user: User.find_by(name: 'Rachel'),
    product: Product.find_by(name: 'Book'),
    quantity: '10',
    sum: '1000'
  }, {
    user: User.find_by(name: 'Rachel'),
    product: Product.find_by(name: 'Table'),
    quantity: '2',
    sum: '1400'
  }, {
    user: User.find_by(name: 'Rachel'),
    product: Product.find_by(name: 'Pen'),
    quantity: '25',
    sum: '375'
  }
])

Purchase.create!([
  {
    user: User.find_by(name: 'Ross'),
    product: Product.find_by(name: 'Book'),
    quantity: '100',
    sum: '10000'
  }, {
    user: User.find_by(name: 'Ross'),
    product: Product.find_by(name: 'Table'),
    quantity: '20',
    sum: '14000'
  }, {
    user: User.find_by(name: 'Ross'),
    product: Product.find_by(name: 'Pen'),
    quantity: '2500',
    sum: '37500'
  }
])

Comment.create!([
  {
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna.',
    user: User.find_by(name: 'Rachel'),
    product: Product.find_by(name: 'Book')
  }, {
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna.',
    user: User.find_by(name: 'Rachel'),
    product: Product.find_by(name: 'Book')
  }, {
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna.',
    user: User.find_by(name: 'Rachel'),
    product: Product.find_by(name: 'Book')
  }
])

Backoffice::User.create!([
  {
    name: 'Admin',
    password: 'password',
    password_confirmation: 'password'
  }, {
    name: 'Test',
    password: 'password',
    password_confirmation: 'password'
  }, {
    name: 'User',
    password: 'password',
    password_confirmation: 'password'
  }
])
