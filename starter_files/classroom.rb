# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
# DATA = {
#   indiana: [94, 82, 59, 95, 55, 98, 93, 84, 81, 75],
#   nevada: [53, 84, 98, 58, 75, 61, 67, 62, 60, 89],
#   drew: [88, 55, 76, 66, 57, 57, 62, 89, 67, 76],
#   dorian: [54, 58, 71, 63, 51, 72, 89, 93, 82, 76],
#   chase: [59, 72, 52, 76, 45, 54, 63, 57, 68, 37],
#   riley: [79, 92, 54, 71, 94, 77, 61, 57, 60, 75],
#   kelly: [76, 92, 94, 89, 99, 66, 75, 93, 73, 96],
#   allison: [87, 74, 77, 99, 58, 76, 55, 50, 89, 58],
#   ryan: [89, 55, 57, 84, 57, 78, 69, 96, 82, 84],
#   remy: [93, 96, 91, 99, 89, 97, 94, 77, 95, 82]
# }

# NOTE: works
def assignment_score(grade_hash, student, assignment_num)
  grade_hash[student][assignment_num - 1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
# NOTE: works
def assignment_scores(grade_hash, assignment_num)
  grade_hash.map{|key, value| grade_hash[key] [assignment_num -1]}
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

# NOTE: doesn't work
def assignment_average_score(grade_hash, assignment_num)
  grade_hash.map do |key, value|
    grade_key[key] [assignment_num -1]
  end
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
# NOTE: works. :+ would be |accumulator,x| accumulator + x
def averages(grade_hash)
  grade_hash.transform_values {|nums| nums.reduce(:+)/nums.size}
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
# NOTE: works
def letter_grade(score)
  if score >= 90
    "A"
  elsif score >= 80
    "B"
  elsif score >= 70
    "C"
  elsif score >= 60
    "D"
  else
    "F"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  grade_hash.transform_values{|nums| letter_grade(nums.reduce(:+)/nums.size)}
  # letter_grade(averages(grade_hash))
end

# Return the average for the entire class.
def class_average(grade_hash)
  grade_hash.to_i.map {|x| x * x}.reduce(1) {|accumulator,x| accumulator/x}
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
end
