class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss) 
        @name = name
        @title = title 
        @salary = salary
        @boss = boss
        @boss.employees << self unless @boss.nil?
    end

    def bonus(multiplier) 
        bonus = (salary) * multiplier
    end

    # def boss=(new_boss)
    #     @boss = new_boss 
    #     @boss.employees << self

    # end
end