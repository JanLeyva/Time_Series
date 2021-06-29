library(chron)
Wtrad=function(data){
	dmes=c(31,28,31,30,31,30,31,31,30,31,30,31)
	valu=function(par){
		anyo=par[1]
		if (leap.year(anyo)) dmes[2]=29
		mes1=par[2]
		we=sum(table(weekdays(dates(paste(mes1,"/1/",anyo,sep=""))+0:(dmes[mes1]-1)))[c(1,7)])
		dmes[mes1]-7*we/2
	}
	mesos=data[3]
	any=rep(data[1],mesos)
	mes=data[2]+0:(mesos-1)
	any=any+(mes-1)%/%12
	mes=(mes-1)%%12+1
	ts(apply(cbind(any,mes),1,valu),start=data[1:2],freq=12)
}

Weaster=function(data,idur=6){

EasterCalendar=matrix(c(1901, 4,  7,
1902, 3, 30,
1903, 4, 12,
1904, 4,  3,
1905, 4, 23,
1906, 4, 15,
1907, 3, 31,
1908, 4, 19,
1909, 4, 11,
1910, 3, 27,
1911, 4, 16,
1912, 4,  7,
1913, 3, 23,
1914, 4, 12,
1915, 4,  4,
1916, 4, 23,
1917, 4,  8,
1918, 3, 31,
1919, 4, 20,
1920, 4,  4,
1921, 3, 27,
1922, 4, 16,
1923, 4,  1,
1924, 4, 20,
1925, 4, 12,
1926, 4,  4,
1927, 4, 17,
1928, 4,  8,
1929, 3, 31,
1930, 4, 20,
1931, 4,  5,
1932, 3, 27,
1933, 4, 16,
1934, 4,  1,
1935, 4, 21,
1936, 4, 12,
1937, 3, 28,
1938, 4, 17,
1939, 4,  9,
1940, 3, 24,
1941, 4, 13,
1942, 4,  5,
1943, 4, 25,
1944, 4,  9,
1945, 4,  1,
1946, 4, 21,
1947, 4,  6,
1948, 3, 28,
1949, 4, 17,
1950, 4,  9,
1951, 3, 25,
1952, 4, 13,
1953, 4,  5,
1954, 4, 18,
1955, 4, 10,
1956, 4,  1,
1957, 4, 21,
1958, 4,  6,
1959, 3, 29,
1960, 4, 17,
1961, 4,  2,
1962, 4, 22,
1963, 4, 14,
1964, 3, 29,
1965, 4, 18,
1966, 4, 10,
1967, 3, 26,
1968, 4, 14,
1969, 4,  6,
1970, 3, 29,
1971, 4, 11,
1972, 4,  2,
1973, 4, 22,
1974, 4, 14,
1975, 3, 30,
1976, 4, 18,
1977, 4, 10,
1978, 3, 26,
1979, 4, 15,
1980, 4,  6,
1981, 4, 19,
1982, 4, 11,
1983, 4,  3,
1984, 4, 22,
1985, 4,  7,
1986, 3, 30,
1987, 4, 19,
1988, 4,  3,
1989, 3, 26,
1990, 4, 15,
1991, 3, 31,
1992, 4, 19,
1993, 4, 11,
1994, 4,  3,
1995, 4, 16,
1996, 4,  7,
1997, 3, 30,
1998, 4, 12,
1999, 4,  4,
2000, 4, 23,
2001, 4, 15,
2002, 3, 31,
2003, 4, 20,
2004, 4, 11,
2005, 3, 27,
2006, 4, 16,
2007, 4,  8,
2008, 3, 23,
2009, 4, 12,
2010, 4,  4,
2011, 4, 24,
2012, 4,  8,
2013, 3, 31,
2014, 4, 20,
2015, 4,  5,
2016, 3, 27,
2017, 4, 16,
2018, 4,  1,
2019, 4, 21,
2020, 4, 12,
2021, 4,  4,
2022, 4, 17,
2023, 4,  9,
2024, 3, 31,
2025, 4, 20,
2026, 4,  5,
2027, 3, 28,
2028, 4, 16,
2029, 4,  1,
2030, 4, 21,
2031, 4, 13,
2032, 3, 28,
2033, 4, 17,
2034, 4,  9,
2035, 3, 25,
2036, 4, 13,
2037, 4,  5,
2038, 4, 25,
2039, 4, 10,
2040, 4,  1,
2041, 4, 21,
2042, 4,  6,
2043, 3, 29,
2044, 4, 17,
2045, 4,  9,
2046, 3, 25,
2047, 4, 14,
2048, 4,  5,
2049, 4, 18,
2050, 4, 10)
,ncol=3,byrow=T,dimnames=list(1901:2050,c("Year","Month","Day")))

	Holdays=rep(0,150)
	Holdays[EasterCalendar[,2]==4]=ifelse(EasterCalendar[EasterCalendar[,2]==4,3]>idur,idur,EasterCalendar[EasterCalendar[,2]==4,3]-1)
	Weight=(idur/2-Holdays)/idur
	Wcalend=rep(0,150*12)
	Wcalend[12*(0:149)+3]=Weight
	Wcalend[12*(0:149)+4]=-Weight

	window(ts(Wcalend,start=c(1901,1),freq=12),start=data[1:2],end=c(data[1]+data[3]%/%12,(data[2]+data[3]-1)%%12))
}
