module Chawan
  class Me
    attr_accessor *%w(
      account_id room_id name chatwork_id organization_id organization_name
      department title url introduction mail tel_organization tel_extension
      tel_mobile skype facebook twitter avatar_image_url
    )

    def initialize args = {}
      args.each do |name, value|
        if respond_to? name.to_sym
          self.send "#{name}=", value
        end
      end
    end
  end
end
