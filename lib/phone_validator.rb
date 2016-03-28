class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present?

    record.errors.add attribute, I18n.t('errors.messages.invalid') unless GlobalPhone.validate(value, :ua)
  end
end
