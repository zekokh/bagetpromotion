namespace :jarvis do
  desc "Генерация и заполнение промокодами"
  task :start => :environment do
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

def check(list, promocod)
  list.each do |code|
    return true if code == promocod
  end
  return false
end