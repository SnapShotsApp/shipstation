module Shipstation::Endpoints
  extend ActiveSupport::Concern
  included do
    def day(datetime)
      datetime.strftime('%m-%d-%Y')
    end

    def carrier_list
      request(:get, 'carriers')
    end

    def carrier_get(id)
      request(:get, 'carriers/getcarrier', carrierCode: id)
    end

    def carrier_add_funds(id, amount)
      request(:post, 'carriers/addfunds', carrierCode: id, amount: amount)
    end

    def carrier_list_packages(id)
      request(:get, 'carriers/listpackages', carrierCode: id)
    end

    def carrier_list_services(id)
      request(:get, 'carriers/listservices', carrierCode: id)
    end

    def customer_get(id)
      request(:get, "customers/#{id}")
    end

    def customer_list(params = {})
      request(:get, 'customers', toCamel(params))
    end

    def fulfillment_list(params = {})
      request(:get, 'fulfillments', toCamel(params))
    end

    def order_get(id)
      request(:get, "orders/#{id}")
    end

    def order_add_tag(id, tag_id)
      request(:post, 'orders/addtag', orderId: id, tagId: tag_id)
    end

    def order_remove_tag(id, tag_id)
      request(:post, 'orders/removetag', orderId: id, tagId: tag_id)
    end

    def order_assign_user(id, user_id)
      request(:post, 'orders/assignuser', orderIds: [id], userId: user_id)
    end

    def order_create(id, params = {})
      request(:post, 'orders/createlabelfororder', { orderId: id }.merge!(toCamel(params)))
    end

    def order_update(id, params = {})
      request(:post, 'orders/createlabelfororder', { orderId: id }.merge!(toCamel(params)))
    end

    def order_list(params = {})
      request(:get, 'orders', toCamel(params))
    end

    def order_list_by_tag(tag_id, params = {})
      request(:get, 'orders/listbytag', { tagId: tag_id }.merge!(toCamel(params)))
    end

    def order_mark_shipped(id, params = {})
      request(:post, 'orders/markasshipped', { orderId: id }.merge!(toCamel(params)))
    end

    def order_restore_from_hold(id)
      request(:post, 'orders/restorefromhold', orderId: id)
    end

    def order_unassign(id)
      request(:post, 'orders/unassignuser', orderIds: [id])
    end

    def product_get(id)
      request(:get, "products/#{id}")
    end

    def product_list(params = {})
      request(:get, 'products', toCamel(params))
    end

    def shipment_list(params = {})
      request(:get, 'shipments', toCamel(params))
    end

    def shipment_create_label(params = {})
      request(:post, 'shipments/createlabel', toCamel(params))
    end

    def shipment_get_rates(params = {})
      request(:post, 'shipments/getrates', toCamel(params))
    end

    def shipment_void_label(id)
      request(:post, 'shipments/voidlabel', shipmentId: id)
    end

    def store_get(id)
      request(:get, "stores/#{id}")
    end

    def store_update(id, params = {})
      request(:put, "stores/#{id}", { storeId: id }.merge!(toCamel(params)))
    end

    def store_get_refresh_status(id)
      request(:get, 'stores/getrefreshstatus', storeId: id)
    end

    def store_refresh(id, date = Time.now)
      request(:post, 'stores/refreshstore', storeId: id, refreshDate: day(date))
    end

    def store_list(params = {})
      request(:get, 'stores', toCamel(params))
    end

    def store_list_marketplaces
      request(:get, 'stores/marketplaces')
    end

    def store_deactivate(id)
      request(:post, 'stores/deactivate', storeId: id)
    end

    def store_reactivate(id)
      request(:post, 'stores/reactivate', storeId: id)
    end

    def user_list(params = {})
      request(:get, 'users', toCamel(params))
    end

    def warehouse_get(id)
      request(:get, "warehouses/#{id}")
    end

    def warehouse_update(id, params = {})
      request(:put, "warehouses/#{id}", toCamel(params))
    end

    def warehouse_create(params = {})
      request(:post, 'warehouses/createwarehouse', toCamel(params))
    end

    def warehouse_list
      request(:get, 'warehouses')
    end
  end
end
