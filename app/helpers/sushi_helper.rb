module SushiHelper
  def formated_date(sushi)
      sushi.created_at.strftime("%a, %e %b %Y %H:%M")
  end
end
