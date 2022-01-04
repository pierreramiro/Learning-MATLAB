classdef SortedNumber < LinkedNode       % SortedNumber_v4 
    properties
        Value
    end
    methods
        function node = SortedNumber(n)
            arguments
                n (1,1) {mustBeNumeric} = 0
            end
            node.Value = n;
        end
        function set.Value(node,newValue)
            arguments
                node
                newValue (1,1) {mustBeNumeric}
            end
            if isempty(node.Owner)
                node.Value = newValue; 
            else
                list = node.Owner;
                list.remove(node);
                node.Value = newValue;
                list.insert(node)                
            end
        end 
        function res = gt(node1,node2)          % >
            res = node1.Value > node2.Value;
        end
        function res = ge(node1,node2)          % >=
            res = node1.Value >= node2.Value;
        end        
        function res = lt(node1,node2)          % <
            res = node1.Value < node2.Value;
        end        
        function res = le(node1,node2)          % <=
            res = node1.Value <= node2.Value;
        end        
        function res = eq(node1,node2)          % ==
            res = node1.Value == node2.Value;
        end        
        function res = ne(node1,node2)          % ~=
            res = node1.Value ~= node2.Value;
        end 
    end
end
            