class IbanValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless IBANTools::IBAN.valid?(value)
      record.errors.add attribute, record.errors.generate_message(attribute, :invalid)
    end
  end
end
