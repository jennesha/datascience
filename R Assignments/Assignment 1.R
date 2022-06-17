#Name: Patricia Jennesha
#Date: September 7, 2021
#File Name: Assignment 1

#1,2. create vectors: studentsID, studentsAges
studentsID <- seq(13000,14500,length.out = 20)
studentAges <- sample(17:25, size=20, T)

#3. print list
print(studentsID)
print(studentAges)

#4. display mean, median, and youngest age in studentAges
#summary(studentAges)
mean(studentAges)
median(studentAges)
min(studentAges)


#5. each student and the corresponding age (cbind)
stuage <- cbind(studentsID, studentAges)
(stuage)


#another option: names(studentAges) <- studentsID

#6. print a list of the ages represented
unique(studentAges)

#7. print a list of duplicated ages
unique(studentAges[duplicated(studentAges)])

#8. print a list of age not represented
setdiff(17:25, unique(studentAges))

#9. print students ages older than 20
studentAges[studentAges > 20]

#10. print a list of students between 18 and 24
studentAges[studentAges>18 & studentAges<=24]

#11. create a bar chart of ages add appropriate labels, colors (barplot)
barplot(studentAges, main="Age of Students", xlab ="Age", ylab ="Student", col=studentAges)
