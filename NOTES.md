Daycare app

Parent Class
Child Class
AgeGroup class

Parents can pay online
Parents can add additional children online
Parents have name, address and contact info
Can sign in and sign out
has many daycare age groups

Owner can remove/add children
Owner can add/update parent
Owner has name address and contact information
Can sign in and sign out
has_many parents, children and age groups (2-5) (6-10) (10-15)

Child has name and belongs_to parent
child belongs to one of three age groups

when a user creates or edits a child, they should also be able to select or create a new parent or daycare age group to associate to that child. In other words, the form for a new child and the form to edit a child should allow the user to select from existing parents and daycare agre groups and create new parents and age groups to associate to the child.
