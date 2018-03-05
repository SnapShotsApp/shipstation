## Shipstation

[![Gem Version](https://badge.fury.io/rb/shipstation.svg)](https://badge.fury.io/rb/shipstation)

A Ruby wrapper for the Shipstation API.
This is a fork of the original version which has different syntax and all endpoints

[Release Notes](http://release.tomdallimore.com/projects/shipstation)

## Installation

Add module to your Gemfile:

```ruby
gem 'shipstation', :git => 'https://github.com/SnapShotsApp/shipstation.git'
```

Then run bundle to install the Gem:

```sh
bundle install
```

Set up an initializer file with your Shipstation API keys:

```ruby
Shipstation::Client.instance.username  = 'shipstation_api_key'
Shipstation::Client.instance.password  = 'shipstation_api_secret'
```
or
```ruby
client = Shipstation::Client.new('shipstation_api_key', 'shipstation_api_secret')
```
e.g. *config/initializers/shipstation.rb*

## Usage

This gem provides a collection of operations for use within the Shipstation API.

### List

List all client methods. Please see <https://shipstation.docs.apiary.io/> for parameter details.

```ruby
client.carrier_list
client.carrier_get(id)
client.carrier_add_funds(id, amount)
client.carrier_list_packages(id)
client.carrier_list_services(id)
client.customer_get(id)
client.customer_list(params)
client.fulfillment_list(params)
client.order_get(id)
client.order_add_tag(id, tag_id)
client.order_remove_tag(id, tag_id)
client.order_assign_user(id, user_id)
client.order_create(id, params)
client.order_update(id, params)
client.order_list(params)
client.order_list_by_tag(tag_id, params)
client.order_mark_shipped(id, params)
client.order_restore_from_hold(id)
client.order_unassign(id)
client.product_get(id)
client.product_list(params)
client.shipment_list(params)
client.shipment_create_label(params)
client.shipment_get_rates(params)
client.shipment_void_label(id)
cleint.store_get(id)
client.store_update(id, params)
client.store_get_refresh_status(id)
client.store_refresh(id, date = Time.now)
client.store_list(params)
client.store_list_marketplaces
client.store_deactivate(id)
client.store_reactivate(id)
client.user_list(params)
client.warehouse_get(id)
client.warehouse_update(id, params)
client.warehouse_create(params)
client.warehouse_list
```

## Versioning

Shipstation Ruby wrapper follows Semantic Versioning 2.0 as defined at
<http://semver.org>.

## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2017 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=shipstation&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))  
Licenced under the MIT licence.

