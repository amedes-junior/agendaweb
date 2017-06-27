prawn_document(page_layout: :portrait, page_size: 'A4') do |pdf|
  pdf.text "Agendaweb"
  pdf.move_down 20

  pdf.text I18n.t('views.contacts.export_pdf.info_data', date: I18n.l(Date.today))
  pdf.text I18n.t('views.contacts.export_pdf.exported', total_exported: @contacts.count)
  pdf.move_down 20

  header_table = [
    t("activerecord.attributes.contact.name"),
    t("activerecord.attributes.contact.birthdate"),
    t("activerecord.attributes.contact.address"),
    t("activerecord.attributes.contact.email"),
    t("activerecord.attributes.contact.cellphone")
  ]

  table = [
    header_table
  ]

  @contacts.each do |contact|
    table << [
      contact.name,
      I18n.l(contact.birthdate),
      contact.address,
      contact.email,
      contact.cellphone
    ]
  end

  pdf.table(table)
end
