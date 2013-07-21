class RobokassaController < ApplicationController

  include ActiveMerchant::Billing::Integrations

  skip_before_filter :verify_authenticity_token # skip before filter if you chosen POST request for callbacks

  # Нотификации от робокассы
  def paid

    # Ищем нотификацию от Робокассы
    notification = Robokassa::Notification.new(request.raw_post, secret: ROBOKASSA_PASS_2)

    # Верна ли подпись?
    if notification.acknowledge

      # Находим заказ
      order = Order.find(notification.item_id)

      # Отмечаем как оплаченный
      Rails.logger.warn 'Marking as paid'
      order.mark_paid
      Rails.logger.warn 'Marked as paid'

      # Сообщаем робокассе, что все хорошо
      render :text => notification.success_response

    else

      # Говорим, что плохой запрос и выключаемся
      head :bad_request

    end

  end

  # Вроде удалось оплатить. но деньги еще не пришли
  def success
  end


  # Не удалось оплатить. Говорим об этом пользователю.
  def fail
  end



end