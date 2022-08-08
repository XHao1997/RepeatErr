clear
clc
close all
w=1;
err_points=[];
err_point_max=zeros(4,1);
err_xyz=[];


while(w <= 4)
    if (w==1)
    input0=load("data/test715/SingleAxis1DataUsingTracker.txt");%在这里修改文件名称
    end 
    if (w==2)
    input0=load("data/test715/SingleAxis2DataUsingTracker.txt");%在这里修改文件名称
    end
    if (w==3)
    input0=load("data/test715/SingleAxis3DataUsingTracker.txt");%在这里修改文件名称
    end
    if (w==4)
    input0=load("data/test715/SingleAxis4DataUsingTracker.txt");%在这里修改文件名称
    end

    

input0(1,:) = [];
% a=sortrows(input0);


times=2;%点重复次数
count=(size(input0,1))/times;%采样点总数
n=times*(times-1)/2;%重复组数

input=zeros(count,size(input0,2),times);

for i=1:times
    input(:,:,i)=input0((i-1)*count+1:i*count,:);
end

input = input*1000;


count0=0;
for i=1:times-1
    temp0=input(:,:,i);
    for j=i+1:times
        temp1=input(:,:,j);
        count0=count0+1;
        temp=temp0-temp1;
        err_xyz(:,(count0-1)*3+1:count0*3,w)=temp(:,6:8);
    end
end



for i=1:count
    for j=1:n
        err_points(i,j,w)=vpa(norm(err_xyz(i,3*(j-1)+1:3*j,w)),10);
    end
end
% 
err_point_max(w,:) =max(err_points(:,:,w));
% 
w
w=w+1;

fprintf("one round finished\n")
end










w = [1 2 3 4];
result = cat(1,w,err_point_max.');
fprintf("the repeat error of the %d Axis is %4.4f \n",result);