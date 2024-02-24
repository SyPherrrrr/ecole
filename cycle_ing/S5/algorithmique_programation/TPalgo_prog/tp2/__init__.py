def fonction(mot):
    mot1:str=""
    mot2:str=""
    cpt1=len(mot)-1
    cpt2=1
    if cpt1!=cpt2:
        mot1=""
        mot2=""
        test=False
        while test!=True:
            if cpt1 != cpt2:
                mot1 = ""
                mot2 = ""
            for i in range(0,cpt1):
                mot1+=mot[i]
                print(mot1)
            for j in range(cpt2,len(mot)):
                mot2+=mot[j]
                print(mot2)
            if mot1!=mot2:
                cpt1+=-1
                cpt2+=1
            else:
                test= True
                return (mot1, mot2, cpt1, cpt2)


test=fonction('blabalbla')
print(test)