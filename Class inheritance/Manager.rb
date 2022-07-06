require_relative "Employee.rb"

class Manager < Employee

    attr_reader :employees
    
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        recursive_sallary * multiplier
    end

    def recursive_sallary
        salary_sum = 0
        @employees.each do |employee| 
            if employee.is_a?(Manager) 
                salary_sum += employee.recursive_sallary + employee.salary
            else
                salary_sum += employee.salary
            end
        end
        salary_sum
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager",  78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
# darren.boss = ned
# shawna.boss = darren
# david.boss = darren

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)