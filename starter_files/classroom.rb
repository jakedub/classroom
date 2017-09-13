# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.

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

# NOTE: doesn't work. So I can get the values to be separated for each but need to do an average based on that individual.

def assignment_average_score(grade_hash, assignment_num)
  # grade_hash.map {|key, value| grade_hash[key] [assignment_num - 1]}.transform_values {|nums| nums.reduce(:+)/nums.size}
  # grade_hash.map{|key,value| grade_hash[key] [assignment_num -1]}.reduce(0) {|accumulator,x| accumulator += x * x/}
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.

# NOTE: works. :+ would be reduce(0) { |sum,x| sum + x }

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

# NOTE: works

def final_letter_grades(grade_hash)
  grade_hash.transform_values {|nums| letter_grade(nums.reduce(:+)/nums.size)}
end

# Return the average for the entire class.

# NOTE: works. fails if doing grades.sum / grades.size.to_f. It's "too exact"

def class_average(grade_hash)
  grades = grade_hash.values.flatten
  grades.sum / grades.size
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
    grades = grade_hash.transform_values {|nums| nums.reduce(:+)/nums.size}
    rank = grades.sort_by { |key, value| value  }.reverse[0,3]
    rank.map {|key, value| key}

    grades = grade_hash.transform_values {|nums| nums.reduce(:+)/nums.size}
    rank = grades.sort_by { |key, value| value  }.reverse
    rank.map {|key, value| key}
end
