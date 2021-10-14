# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection


hex_curve = ent.add_circle [0, 0, 0], [0, 0, 1],5
hex_face = ent.add_face hex_curve
hex_face.pushpull -3


screw_curve = ent.add_circle [0, 0, -8], [0, 0, 1], 1.5
screw_face = ent.add_face screw_curve
screw_face.pushpull 8

bolt_group = ent.add_group ent.to_a


nut_curve = ent.add_ngon [10, 0, 0], [0, 0, 1], 3, 4
nut_face = ent.add_face nut_curve
nut_face.reverse!
nut_face.pushpull 1.5
cut_curve = ent.add_circle [10, 0, 0], [0, 0, 1], 1.5
cut_curve[0].faces[0].pushpull -1.5
nut_group = ent.add_group cut_curve[0].faces[0].all_connected
nut_group.transform! [-10, 0, -7]


full_group = ent.add_group bolt_group, nut_group
t2 = Geom::Transformation.translation [10, 10, 10]
t1 = Geom::Transformation.rotation [0, 0, 0], [1, 1, 1], -45.degrees
full_group.transform! t1 * t2
