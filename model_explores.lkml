include: "//cortex/views/**/*.view"

explore: data_intelligence_ar {
  sql_always_where: ${Client_ID} = "...client-id" ;;
}

explore: data_intelligence_otc {
  sql_always_where: ${Client_ID} = "...client-id" ;;
}

explore: sales_orders {

  join: language_map {
    fields: []
    type: left_outer
    sql_on: ${language_map.looker_locale}='{{ _user_attributes['locale'] }}' ;;
    relationship: many_to_one
  }

  join: deliveries{
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.sales_document_vbeln}=${deliveries.sales_order_number_vgbel} and ${sales_orders.item_posnr}=${deliveries.sales_order_item_vgpos} and ${sales_orders.client_mandt}=${deliveries.client_mandt};;
  }

  join: materials_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.material_number_matnr}=${materials_md.material_number_matnr} and ${sales_orders.client_mandt}=${materials_md.client_mandt} ;;
  }

  join: customers_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${customers_md.customer_number_kunnr}=${sales_orders.sold_to_party_kunnr} and ${sales_orders.client_mandt}=${customers_md.client_mandt} and ${customers_md.language_key_spras}=${language_map.language_key};;
  }

  join: countries_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${customers_md.country_key_land1}=${countries_md.country_key_land1} and ${countries_md.client_mandt}=${sales_orders.client_mandt} and ${countries_md.language_spras}=${language_map.language_key} ;;
  }

  join: sales_organizations_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_organizations_md.sales_org_vkorg}=${sales_orders.sales_organization_vkorg} and ${sales_organizations_md.client_mandt}=${sales_orders.client_mandt} and ${sales_organizations_md.language_spras}=${language_map.language_key} ;;
  }
  join: distribution_channels_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${distribution_channels_md.distribution_channel_vtweg}=${sales_orders.distribution_channel_vtweg} and  ${sales_orders.client_mandt}=${distribution_channels_md.client_mandt} and ${distribution_channels_md.language_spras}=${language_map.language_key};;
  }

  sql_always_where: ${client_mandt} = "...client-mandt" ;;
}

explore: Navigation_Bar {}
