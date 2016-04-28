def execute_op(*p)
	if p[1].nil? || p[1].size == 0 
		then return p[0]
	else
		p[0].send(p[1][0][0],p[1][0][1])
	end
end

def zero(*p)
	execute_op(0,p)
end
def one(*p)
	execute_op(1,p)
end
def two(*p)
	execute_op(2,p)
end
def three(*p)
	execute_op(3,p)
end
def four(*p)
	execute_op(4,p)
end
def five(*p)
	execute_op(5,p)
end
def six(*p)
	execute_op(6,p)
end
def seven(*p)
	execute_op(7,p)
end
def eight(*p)
	execute_op(8,p)
end
def nine(*p)
	execute_op(9,p)
end
def plus(*p)
	[:+,p[0]]
end
def minus(*p)
	[:-,p[0]]
end
def times(*p)
	[:*,p[0]]
end
def divided_by(*p)
	[:/,p[0]]
end

puts "0+0=#{zero(plus(zero))}"
puts "5+7=#{five(plus(seven))}"
puts "3x2=#{three(times(two))}"
puts "8/4=#{eight(divided_by(four))}"
