def validSolution(board)
	return (check_rows(board) and check_columns(board) and check_blocks(board))
end

def check_blocks(board)
	valid = true
	blocks_position = [0,3,6]
	blocks_position.product(blocks_position).each do |position|
		valid = false unless check_block(board,position)
	end
	return valid
end

def check_block(board,position)
	x = position[0]
	y = position[1]
	line = []
	x.upto(x+2) do |i|
		y.upto(y+2) do |j|
			line << board[i][j]
		end
	end
	return check_line(line)
end

def check_columns(board)
	valid = true # until we demostrate the opposite
	0.upto(8) do |i|
		column = []
		0.upto(8) do |j|
			column << board[j][i]
		end
		valid = false unless check_line(column)
	end
	return valid
end

def check_rows(board)
	valid = true # until we demostrate the opposite
	board.each do |row|
		valid = false unless check_line(row)
	end
	return valid
end

def check_line(row)
	row.sort == 1.upto(9).to_a
end

puts validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
		    [6, 7, 2, 1, 9, 5, 3, 4, 8],
		    [1, 9, 8, 3, 4, 2, 5, 6, 7],
		    [8, 5, 9, 7, 6, 1, 4, 2, 3],
		    [4, 2, 6, 8, 5, 3, 7, 9, 1],
		    [7, 1, 3, 9, 2, 4, 8, 5, 6],
		    [9, 6, 1, 5, 3, 7, 2, 8, 4],
		    [2, 8, 7, 4, 1, 9, 6, 3, 5],
		    [3, 4, 5, 2, 8, 6, 1, 7, 9]])

puts validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
		    [6, 7, 2, 1, 9, 0, 3, 4, 9],
		    [1, 0, 0, 3, 4, 2, 5, 6, 0],
		    [8, 5, 9, 7, 6, 1, 0, 2, 0],
		    [4, 2, 6, 8, 5, 3, 7, 9, 1],
		    [7, 1, 3, 9, 2, 4, 8, 5, 6],
		    [9, 0, 1, 5, 3, 7, 2, 1, 4],
		    [2, 8, 7, 4, 1, 9, 6, 3, 5],
		    [3, 0, 0, 4, 8, 1, 1, 7, 9]])
