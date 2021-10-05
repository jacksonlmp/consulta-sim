class Endereco < ApplicationRecord
  belongs_to :paciente

  #Validates
  validates :cep, presence: true, numericality: { only_integer: true }, length: {is: 8}
  validates :cidade, presence: true, length: {minimum: 4, too_short: "Must have at least 4 characters!", maximum:50, too_long: "deve conter no maximo 50 characters!"}
  validates :bairro, presence: true, length: {minimum: 4, too_short: "Must have at least 4 characters!", maximum:50, too_long: "deve conter no maximo 50 characters!"}
  validates :logradouro, presence: true, length: {minimum: 4, too_short: "Must have at least 4 characters!", maximum:50, too_long: "deve conter no maximo 50 characters!"}
  validates :complemento, length: {maximum:50, too_long: "Must have at maximum 50 characters!"}
end
