function arr = remove(target,sub, x_start, y_start)
    
    %Removes sub from the target 
    arr = target;

    [sub_x, sub_y] = size(sub);
    [tar_x, tar_y] = size(target);

    %Accounts for start values that go over bound
    if sub_x + x_start > tar_x+1
        sub = sub(1:(tar_x-x_start+1), :);
    end

    if sub_y+y_start > tar_y+1
        sub = sub(:, 1:(tar_y-y_start+1));
    end

    %Accounts for negative start values by resizing sub to fit
    if x_start < 1
        sub = sub((abs(x_start)+2):end ,:);
        x_start = 1;
    end

    if y_start < 1
       sub = sub(:, (abs(y_start)+2):end);
       y_start = 1;       
    end

    [sub_x, sub_y] = size(sub);

    %Removes sub from arr and creates the new arr
    cuts = arr(x_start:(sub_x+x_start-1), y_start:(sub_y+y_start-1));

    cuts(sub<cuts) = sub(sub<cuts);

    arr(x_start:(sub_x+x_start-1), y_start:(sub_y+y_start-1)) = cuts;
    
end