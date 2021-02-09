class  IncomeItem < ActiveHash::Base
  self.data = [
      {id: 1, name: "給料"}, {id: 2, name: "残業代"}, {id: 3, name: "ボーナス"},
			{id: 4, name: "出張旅費"}, {id: 5, name: "その他の手当て"}, {id: 6, name: "健康保険給付金"},
			{id: 7, name: "懸賞金"}, {id: 8, name: "サイドビジネス"}, {id: 9, name: "児童手当"},
			{id: 10, name: "受贈品"}, {id: 11, name: "所得税還付金"}, {id: 12, name: "その他"},
			{id: 13, name: "受取利息"}, {id: 14, name: "配当金"}, {id: 15, name: "売却損益"}
  ]
end