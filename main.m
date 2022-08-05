clear
clc
close all
w=4
while(w <= 4)
    if (w==1)
    input0=load("data/test715/SingleAxis1Data.txt");%在这里修改文件名称
    end 
    if (w==2)
    input0=load("data/test715/SingleAxis2Data.txt");%在这里修改文件名称
    end
    if (w==3)
    input0=load("data/test715/SingleAxis3Data.txt");%在这里修改文件名称
    end
    if (w==4)
    input0=load("data/test715/SingleAxis4DataUsingTracker.txt");%在这里修改文件名称
    end
    count=0;
    
% for i=2:10000
%     if norm(input0(1,1:4)-input0(i,1:4))<0.1
%         i
%         count=count+1;
%         if count==3
%         break;
%         end
%     end
% end

a=sortrows(input0);


times=2;%点重复次数
count=(size(input0,1)-1)/times ;%采样点总数


n=times*(times-1)/2;

input=zeros(count,size(input0,2),times);

for i=1:times
    input(:,:,i)=input0((i-1)*count+1:i*count,:);
end

err_xyz=zeros(count,3*n);

count0=0;
for i=1:times-1
    temp0=input(:,:,i);
    for j=i+1:times
        temp1=input(:,:,j);
        count0=count0+1;
        temp=temp0-temp1;
        err_xyz(:,(count0-1)*3+1:count0*3)=temp(:,6:8);
    end
end

err_points=zeros(count,n);

for i=1:count
    for j=1:n
       err_points(i,j)=norm(err_xyz(i,(j-1)+1:j));
    end
end

err_point1=zeros(count,n);

for i=1:n
err_point1(:,i)=err_points(:,(i-1)*3+1);

w=w+1;
end




end
