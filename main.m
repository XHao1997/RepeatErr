clear
clc
close all
w=1;
err_points=[];
err_point_max=zeros(4,1);
err_xyz=[];


while(w <= 4)
    if (w==1)
    input0=load("data/20220808/SingleAxis1DataUsingTracker.txt");%在这里修改文件名称
    j_limited = -15: 3: 15;
    end 
    if (w==2)
    input0=load("data/20220808/SingleAxis2DataUsingTracker.txt");%在这里修改文件名称
    j_limited = -40:8:40;
    end
    if (w==3)
    input0=load("data/20220808/SingleAxis3DataUsingTracker.txt");%在这里修改文件名称
    j_limited = -20:4:20;
    end
    if (w==4)
    input0=load("data/20220808/SingleAxis4DataUsingTracker.txt");%在这里修改文件名称
    j_limited = -10:2:10;
    end

    

input0(1,:) = [];
a=sortrows(input0);

% tabulate(a(:,1))
% times=30;%点重复次数
n=1;
temp=[];
count = 0;
err_xyz = [];
err_points = [];
a_temp = [];
for i=j_limited
    count_pre = count+1;
    count = count_pre+sum(a(:,1)==i)-1;
    a_temp = a(count_pre:count,:);
    for j=1:size(a_temp,1)
        for k=j+1:size(a_temp,1)
            err_xyz(n,:)=a_temp(j,6:8)-a_temp(k,6:8);
            err_points(n,:) = 1000*norm(err_xyz(n,:));
            n = n+1;
        end
    end
    
end
max(err_points)

w=w+1;
end





