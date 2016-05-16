class Student
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  # In Mongo, we define indexes in the model
  # However, simply defining it doesn't mean it's there. We need to run a rake job
  # to implement it fully. Unlike Rails, it has better integration for uniqueness
  index({ email: 1 }, { unique: true })
end
