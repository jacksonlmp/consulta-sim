class Medico < ApplicationRecord
    validates :nomeCompleto, presence: true, length: {minimum: 3, too_short: "Must have at least 3 characters "}
    validates :cpf, length: {is: 11}, presence: true, uniqueness: true,numericality: { only_integer: true }
    validates :email, presence: true
    validates :especialidade, presence: true
    validates :crm, presence: true, uniqueness: true
    validates :dataNascimento, presence: true
    validate :validateDataNascimento

    def validateDataNascimento
        if dataNascimento.present? && dataNascimento > Date.today
          errors.add(:dataNascimento, "é uma data invalida")
        end
      end
end
