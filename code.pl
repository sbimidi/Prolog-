/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CSE/259 FINAL PROJECT
Names- Jay Patel and Sandeep reddy bimidi
asu ID: 1221414285 and 1222081185
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
runit :- 
    daughter(redhair,i), 
    mother(redhair,i), 
    son_in_law(dad,i), 
    brother(baby,dad),
    uncle(baby,i), 
    brother(baby,redhair), 
    grandchild(onrun,i), 
    mother(widow,redhair),
    grandmother(widow,i), 
    grandchild(i,widow), 
    grandfather(i,i),!.

spouse(i,widow).
spouse(widow,i).
spouse(dad,redhair).
spouse(redhair,dad).

female(widow).
female(redhair).

male(dad).
male(i).
male(onrun).
male(baby).

child(redhair,widow).
child(i,dad).
child(onrun,dad).
child(baby,i).

parent(X,Y):- (father(X,Y); mother(X,Y)).

father(X,Y):- male(X), (child(Y,X); spouse(X,Z), child(Y,Z)).

mother(X,Y) :- female(X), (child(Y,X); spouse(X,Z), child(Y,Z)).

daughter(X,Y):- female(X), (child(X,Y); spouse(Y,Z), child(X,Z)).

son(X,Y):- male(X), (child(X,Y); spouse(Y,Z), child(X,Z)).

son_in_law(X,Y):- male(X), spouse(X,Z), (child(Z,Y); spouse(Y,A), child(Z,A)).

sibling(X,Y):- (child(X,Z), child(Y,Z); child(X,Z), spouse(Z,A), child(Y,A)).

brother(X,Y):- male(X), sibling(X,Y).

sister(X,Y):- female(X), sibling(X,Y).

uncle(X,Y):- male(X), child(Y,Z), (sibling(X,Z); spouse(Z,A), sibling(X, A)).

grandparent(X,Y):- (grandfather(X,Y); grandmother(X,Y)).

grandfather(X,Y):- male(X), (father(Z,Y), father(X,Z); mother(Z,Y), father(X,Z)).

grandmother(X,Y):- female(X), (father(Z,Y), mother(X,Z); mother(Z,Y), mother(X,Z)).

grandchild(X,Y):- (grandfather(Y,X);grandmother(Y,X)).