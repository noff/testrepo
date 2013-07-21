require 'active_merchant'
require 'active_merchant/billing/integrations/action_view_helper'

ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

#ActionViewHelper::Billing::Base.integration_mode = :production # :test for sandbox
ActiveMerchant::Billing::Base.integration_mode = :test