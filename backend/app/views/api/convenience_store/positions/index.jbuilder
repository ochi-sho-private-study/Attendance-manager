# frozen_string_literal: true

json.positions do
  json.array! @positions do |position|
    json.partial! 'api/convenience_store/positions/position', position: position
  end
end
