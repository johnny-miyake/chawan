module Chawan
  class EndpointBuilder
    attr_accessor :path_struct

    def initialize params = {}
      case params
      when Hash
        @path_struct = params
      else
        @path_struct = {params.to_s => {}}
      end
    end

    def to_ep
      "/#{Chawan::API_VERSION}/#{build_path path_struct}"
    end

    private
    def build_path ps
      name, data = ps.first
      name.to_s.tap do |path|
        if data.is_a?(Hash) && data.has_key?(:id)
          path << "/"
          path << data[:id].to_s
          child_resource = data.reject{|k, v| k == :id}
          path << "/" << build_path(child_resource) if child_resource.any?
        end
      end
    end
  end
end
