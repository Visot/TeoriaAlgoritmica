import math
def coeficientes(B,n):
	coe=[]
	while n//B!=0:
		coe.append(n%B)
		n = n//B
	coe.append(n)
	return coe
def karatsuba(x,y,B,n):
	print(x,y)
	x=coeficientes(B**n,x)
	print(x)
	y=coeficientes(B**n,y)
	print(y)
	if n>4:
		t=karatsuba((x[0]+x[1]),(y[0]+y[1]),B,math.ceil(n/2))
		u=karatsuba((x[0]-x[1]),(y[0]-y[1]),B,math.ceil(n/2))
		v=karatsuba(x[1],y[1],B,math.ceil(n/2))
		return (t+u)/2 -v+ (t-u)*(B**n)/2+v*B**(2*n)
	else:
		t=(x[0]+x[1])*(y[0]+y[1])
		u=(x[0]-x[1])*(y[0]-y[1])
		v=x[1]*y[1]
		return (t+u)/2 -v+ (t-u)*(B**n)/2+v*B**(2*n)

r=karatsuba(56132078345,45321087678,10,6)
print(r)
print(56132078345*45321087678)
