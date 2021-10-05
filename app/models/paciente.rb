class Paciente < ApplicationRecord
    has_many :consultas, dependent: :destroy
    has_many :enderecos, dependent: :destroy
    
    accepts_nested_attributes_for :enderecos, allow_destroy: true, reject_if: :all_blank

    #Validates
    validates :nomeCompleto, presence: true, length: {minimum: 5, too_short: "Must have at least 5 characteres "}
    validates :cpf, length: {is: 11}, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :email, presence: true, uniqueness: true, length: {minimum: 5, too_short: "Must have at least 5 characteres ", maximum: 50, too_long: "Must have at maximum 50 characters" }
    validates :dataNascimento, presence: true
    validates :enderecos, presence: true
    validate :validarDataNascimento
    

    def validarDataNascimento
        if dataNascimento.present? && dataNascimento > Date.today
          errors.add(:dataNascimento, "Invalid Date")
        end
    end
end

