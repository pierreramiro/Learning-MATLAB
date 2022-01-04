classdef LinkedNode < handle       % LinkedNode_v9
    properties (Access = {?Country ?LinkedNode})
        Prev
        Next
        Country
    end
    methods (Abstract) %comparison
        gt(a,b)
        ge(a,b)
        lt(a,b)
        le(a,b)
        eq(a,b)
        ne(a,b)
        disp(a)
    end
    methods
        function node = LinkedNode() %constructor
            node.Prev = [];
            node.Next = [];
            node.Country = [];
        end
        function delete(node) %elimina un nodo
            if ~isempty(node.Country)
                node.Country.remove(node);
            end
        end
    end
    methods (Access = protected) %vuelve a ordenar la lista
        function reposition(obj)
            if ~isempty(obj.Country)
                list = obj.Country;
                list.remove(obj);
                list.insert(obj);
            end
        end
    end
end
      