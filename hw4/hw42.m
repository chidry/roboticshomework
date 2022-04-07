load("HW42.txt");%load data
data=HW42;
ax=data(:,1);
ay=data(:,2);
az=data(:,3);
t=0.6;
for i=1:99
    q1(1)=1;q2(1)=1;q3(1)=1;q4(1)=1;
    ss=q2(i)*q4(i)-q1(i)*q3(i);
    tt=q1(i)*q2(i)+q3(i)*q4(i);
    uu=0.5-q2(i)*q2(i)-q3(i)*q3(i);
    c1(i)=-19.6*(19.6*q3(i)*ss+ax(i)*q3(i)-19.6*q2(i)*tt-q2(i)*ay(i));
    c2(i)=-19.6*(-19.6*q4(i)*ss-ax(i)*q4(i)-19.6*q1(i)*tt-ay(i)*q1(i)+39.2*q2(i)*uu+2*az(i)*q2(i));
    c3(i)=-19.6*(19.6*q1(i)*ss+ax(i)*q1(i)-19.6*q4(i)*tt+2*ay(i)*q4(i)+39.2*q3(i)*uu+2*az(i)*q3(i));
    c4(i)=-19.6*(-19.6*q2(i)*ss-ax(i)*q2(i)-19.6*q3(i)*tt-q3(i)*ay(i));
    scc(i)=(384.16*(c1(i)^2+c2(i)^2+c3(i)^2+c4(i)^2))^0.5;
    cc1(i)=c1(i)/scc(i);
    cc2(i)=c2(i)/scc(i);
    cc3(i)=c3(i)/scc(i);
    cc4(i)=c4(i)/scc(i);
    q1(i+1)=q1(i)-t*cc1(i);
    q2(i+1)=q2(i)-t*cc2(i);
    q3(i+1)=q3(i)-t*cc3(i);
    q4(i+1)=q4(i)-t*cc4(i);
    q(1,:)=[q1(1),q2(1),q3(1),q4(1)];
    q(i+1,:)=[q1(i+1),q2(i+1),q3(i+1),q4(i+1)];%answer
end
scatter(1:100,q,'filled');
xlabel('Number of gradient descent')
ylabel('q number,q1:blue,q2:red,q3:orange,q4:purple')
%scatter3(q1,q2,q3,'filled');