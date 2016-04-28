def tribonacci(signature,n)
	return null if n <= 0
	return signature[0..(n-1)] if n <= 3
	return tribonacci(signature[1..2].push(signature.reduce(:+)),n-1).unshift(signature[0])
end
puts tribonacci([1,1,1],0)
