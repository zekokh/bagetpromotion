class PromocodController < ApplicationController
  def index

  end

  def check(list, promocod)
    list.each do |code|
      return true if code == promocod
    end
    return false
  end

  def searche
    promocod = Promocod.find_by(code: params[:code])
puts promocod
    if promocod.blank?
      redirect_to '/promocod', notice: 'Промокод не найден'
    else
      if promocod[:used]
        params[:code] = ""
        redirect_to '/promocod', notice: "Промокод уже был использован: #{promocod[:updated_at]}"
      else
        if promocod.update(used: true)
          redirect_to '/promocod', notice: 'Отдайте багет клиенту! Промокод активирован.'
        else
          redirect_to '/promocod', notice: 'Не удалось активировать промокод. Попробуйте попозже или обратитесь к Руслану!'
        end
      end
    end
  end

  def grate
    list = Array.new
    rnd = Random.new
    n = 1
    while n < 400 do
      puts n
      promocod = rnd.rand(100000..900000)
      unless check(list, promocod)
        Promocod.create(code: promocod)
        list.push(promocod)
        n=n+1
        puts n
      end
    end
  end
end
