bando = Daycare.create(address:  "7 corporate drive", phone_number:  "8005885437")

bey = Parent.create(first_name:  "Beyonce", last_name:  "Carter", address:  "125 billionaire row", :phone_number => "3338675309")
jay = Parent.create(first_name:  "Shawn", last_name:  "Carter", address:  "125 billionaire row", :phone_number => "3338675309")

blu = Child.create(first_name:  "Blu Ivy", last_name:  "Carter")
sir = Child.create(first_name:  "Sir", last_name:  "Carter")

AgeGroup.create(title: "toddler", description:  "1", daycare_id: "1")
AgeGroup.create(title:  "littles", description: "2", daycare_id: "1")
AgeGroup.create(title:  "pre_teen", description:  "3", daycare_id: "1")
