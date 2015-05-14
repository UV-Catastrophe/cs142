class TabsController < ApplicationController
	def show2
		@title = 'Show Tabs'
		
		tab_labels1 = ['Inventory', 'Order Information', 'Accounts', 'Shippers', 'Suppliers']
		tab_labels2 = ['Cattlefish', 'Gerrymander', 'Didjeridoo', 'Raccoongeroo', 'Velocelot']

		@selected_tab1 = params.fetch(:selected_tab1, tab_labels1[0])
		@selected_tab2 = params.fetch(:selected_tab2, tab_labels2[0])

		@tab_contents1 = tab_labels1.map { |x|
			{label: x, url: "?selected_tab1=#{URI.encode(x)}&selected_tab2=#{URI.encode(@selected_tab2)}"}
		}
		@tab_contents2 = tab_labels2.map { |x|
			{label: x, url: "?selected_tab1=#{URI.encode(@selected_tab1)}&selected_tab2=#{URI.encode(x)}"}
		}
	end
end