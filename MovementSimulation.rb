mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
n=5 #Kutu sayısı
s=100.feet #Boşluk
w=60.feet#Genişlik
(0..n-1).each {|i|
(0..n-1).each {|j|
#1.Yüzeyin oluşturulması



face = ent.add_face [i*s,j*s,0],[i*s,j*s+w,0],[i*s+w,j*s+w,0],[i*s+w,j*s,0]
face.back_material = [rand(255).to_i, rand(255).to_i, rand(255).to_i]
height=200.feet
face.pushpull -height

}
}
