
% connect with the datbase first


% Open the DB file , connect via mksqlite
mksqlite('open', 'animals.db');
results = mksqlite('select * from animal' );

% prepare your inputs 
p1=feature_extraction(results(1).photo);% use the 1st photo of the database (first cow).
p2=feature_extraction(results(6).photo);% use the 6th photo of the database(first frog).
% initial weight and bias .
b=-10;  w=[50 20];

%put the target output
% take them from the database 
t1=results(1).target;
t2=results(6).target; 


i=0;
%firts iteration : 
while 1
a1=hardlim(w*p1+b);
if a1==t1
    a2=hardlim(w*p2+b);
    if a2==t2
        break;
    else
        e=t2-a2;
        w=w+e*p2;
        b=b+e;
    end
else
    e=t1-a1;
    w=w+e*p1;
    b=b+e;
    
end
if a1==t1 && a2==t2
    break;
end
end

pt=feature_extraction('DB/caw2.jpg');
at=hardlim(w*pt+b);

%cleanup
mksqlite('close');
