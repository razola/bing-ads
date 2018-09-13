module Bing
  module Ads
    module API
      module V11
        module Data
          # Bing::Ads::API::V11::Data::Campaign
          class Campaign

            # @order
            # https://msdn.microsoft.com/en-us/library/bing-ads-campaign-management-campaign.aspx
            KEYS_ORDER = [
              :bidding_scheme,
              :budget_type,
              :daily_budget,
              :description,
              :forward_compatibility_map,
              :id,
              :name,
              :native_bid_adjustment,
              :status,
              :time_zone,
              :tracking_url_template,
              :url_custom_parameters,
              # Alphabetical till here
              :campaign_type,
              :settings,
              :budget_id,
              :languages
            ]

            def self.prepare(campaign_raw)
              if campaign_raw[:bidding_scheme]
                # MaxClicksBiddingScheme, MaxConversionsBiddingScheme and TargetCpaBiddingScheme
                if campaign_raw[:bidding_scheme].is_a?(Hash)
                  campaign_raw[:bidding_scheme]['@xsi:type'] = "#{Bing::Ads::API::V11::NAMESPACE_IDENTIFIER}:#{campaign_raw[:bidding_scheme][:type]}"              
                else
                  campaign_raw[:bidding_scheme] = {
                    type: campaign_raw[:bidding_scheme],
                    '@xsi:type' => "#{Bing::Ads::API::V11::NAMESPACE_IDENTIFIER}:#{campaign_raw[:bidding_scheme]}"
                  }
                end
              end
              # TODO UrlCustomParameters
              # TODO Settings
              campaign_raw = Bing::Ads::Utils.sort_keys(campaign_raw, KEYS_ORDER)
              Bing::Ads::Utils.camelcase_keys(campaign_raw)
            end
          end
        end
      end
    end
  end
end
