import numpy as np
from stl import mesh

# Using an existing closed stl file:
your_mesh = mesh.Mesh.from_file('PinewoodDerby-Weston.stl')

volume, cog, inertia = your_mesh.get_mass_properties()
print("Volume                                  = {0}".format(volume))
print("Position of the center of gravity (COG) = {0}".format(cog))
print("Inertia matrix at expressed at the COG  = {0}".format(inertia[0,:]))
print("                                          {0}".format(inertia[1,:]))
print("                                          {0}".format(inertia[2,:]))

ideal_center = (0.81+4.4)*25.4-25.4
print("Ideal center of mass is %s, this car has %s" % ((ideal_center,cog[1])))
Wood_weight = ((volume * 0.51 / 35.2739619)/(10**3))
print("car weight will be %s ounces" % Wood_weight)
added_weight = 5-Wood_weight
x_weight = ideal_center-(Wood_weight/added_weight)*(cog[1]-ideal_center)
print("add %s ounces at %s" % (added_weight,x_weight))

