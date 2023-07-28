# frozen_string_literal: true

require 'raspi-gpio'
pin = Array.new(40)

(0..40).each do |p|
  pin[p] = GPIO.new(p, OUT)
end

ASSIGNMENT = Array.new(3)
SYSTEM_IMAGE = {}.freeze

(0..3).each do |b|
  ASSIGNMENT[b] = Array.new(40)
end

BUFFER = Array.new(40)
number = Array.new(40)
return_number = Array.new(40)

(0..40).each do |e|
  number[e] = 0
end

def enter; end

def retro(pin)
  (0..40).each do |p|
    pin[p].set_mode(IN)
  end
end

41.times do
  BUFFER = number
  (0..40).each do |d|
    case number[d]
    when 0
      number[d] = 1
      break
    when 1
      number[d] = 0
    else
      break
    end
  end

  enter

  retro(pin)

  (0..40).each do |f|
    if BUFFER[f] == number[f]
      return_number[f] = 0
    elsif BUFFER[f] != number[f]
      return_number[f] = 1
    end
  end
  key = number.chomp
  value = return_number.chomp
  SYSTEM_IMAGE[key] = value
end
