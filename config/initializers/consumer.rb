channel = RabbitMq.consumer_channel
queue = channel.queue('geocoding', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)
  coordinates = Geocoder.geocode(payload['city'])

  if coordinates.present?
    # client = AdsService::RpcClient.fetch
    # client.update_coordinates(payload['id'], coordinates)

    client = AdsHttp::Client.new
    client.update_coordinates(id_object: payload['id'], coordinates: coordinates)
  end

  channel.ack(delivery_info.delivery_tag)
end