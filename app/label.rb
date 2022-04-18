require_relative './item.rb'

class Label< Item

    attr_accessor :id, :title, :color, :items

    def initialize(title,color,items,id=Random.rand(1..100000))
        @id=id
        @title=title
        @color=color
        @items=items
    end
end