class  ExpenseItem < ActiveHash::Base
  self.data = [
      {id: 1, name: "住居費"}, {id: 2, name: "水道光熱費"}, {id: 3, name: "通信費"},
			{id: 4, name: "保険料"}, {id: 5, name: "食費"}, {id: 6, name: "日用品費"},
			{id: 7, name: "被服費"}, {id: 8, name: "美容費"}, {id: 9, name: "交際費"},
			{id: 10, name: "医療費"}, {id: 11, name: "特別費"}, {id: 12, name: "雑費"}
  ]
end