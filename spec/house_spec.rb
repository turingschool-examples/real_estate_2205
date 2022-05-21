require './lib/room'
require './lib/house'

RSpec.describe Room do
  let!(:room1) {Room.new(:bedroom, 10, '13')}
  let!(:room2) {Room.new(:living_room, 15, '12')}
