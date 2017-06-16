function [newlist] = cutheadandtail(oldlist, crietion)
    l1 = size(oldlist,1);
    l2 = 1;
    while (oldlist(l1) < crietion)
        l1 = l1 - 1;
    end
    while (oldlist(l2) < crietion)
        l2 = l2 + 1;
    end
    newlist = oldlist(l2:l1);
end
