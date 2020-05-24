# frozen_string_literal: true

class ChatroomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :members
end
