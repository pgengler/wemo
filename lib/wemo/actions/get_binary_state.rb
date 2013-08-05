module Wemo
  module Actions
    class GetBinaryState
      def self.name
        "GetBinaryState"
      end

      def self.payload
        <<-XML
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
<s:Body>
  <u:GetBinaryState xmlns:u="urn:Belkin:service:basicevent:1"></u:GetBinaryState>
</s:Body>
</s:Envelope>
        XML
      end
    end
  end
end