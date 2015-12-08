class CreateJoinTableCityIndustry < ActiveRecord::Migration
  def change
    create_join_table :cities, :industries do |t|
       t.index [:city_id, :industry_id]
       t.index [:industry_id, :city_id]
     end
  end
end
