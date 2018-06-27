require 'adv_logger'
class AdvertismentObserver < ActiveRecord::Observer
    def after_create(record)
        @log = AdvLogger.instance
        data = [record.brand_id,record.variant_id, record.user_id, record.fueltype, record.kmdriven, record.ownercount, record.price ]
        @log.logAds(data)
    end
end