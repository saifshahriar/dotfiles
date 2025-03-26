
# Print gaps in numbers (inclusively)
# http://stackoverflow.com/questions/15867557/finding-gaps-sequential-numbers
#
# $ cat data
# 1
# 2
# 3
# 6
# 10
# $ cat data
# 4-5
# 7-9
function gaps
	awk '$1 != (p+1) { print [p+1 ", " $1-1] } { p = $1 }'
end

# Figure out the max number of given input
#
# $ cat data
# 1
# 2
# 3
# $ max < data
# 3
function max
	local f=${1:-1}
	awk -F "${2:- }" "
	length(\$$f) {
		if (max == \"\" || \$$f > max)
			max = \$$f
	}
	END { print max; }"
end

# Figure out the min number of given input
#
# $ cat data
# 1
# 2
# 3
# $ min < data
# 1
function min
	local f=${1:-1}
	awk -F "${2:- }" "
	length(\$$f) {
		if (min == \"\" || \$$f < min)
			min = \$$f
	}
	END { print min; }"
end

# Print a summary for input data
# show average, sum, min and max
function summarize
	local f=${1:-1}
	awk -F "${2:- }" "
	length(\$$f) {
		if (max == \"\")
			max = min = \$$f;
		i += 1;
		sum += \$$f;
		if (\$$f > max)
			max = \$$f
		if (\$$f < min)
			min = \$$f
	}
	END {
		print \"lines\\t\", i;
		print \"min\\t\", min;
		print \"max\\t\", max;
		print \"sum\\t\", sum;
		print \"avg\\t\", sum/i;
	}"
end
