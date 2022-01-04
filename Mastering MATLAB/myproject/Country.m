classdef Country < handle
    properties (Access = {?State,?Country}) %subclass of this class can access
        Country_Name (1,1)  string
        Head
        Tail
        Length              uint32
    end
    methods
        function list = Country (name)
            arguments
               name = '' 
            end
            list.Country_Name = name;
            list.Head = [];
            list.Tail = [];
            list.Length = 0;
        end
        function lng  = length(list)
            lng = list.Length;
        end
        
        function cname=get_country_name(list)
            cname = list.Country_Name;
        end
        function state_obj=get_state_obj(list,index)
            item = list.Head;
            count = 1;
            while(count<index)
                count=count+1;
                item = item.Next;
            end
            state_obj= item;
        end
        function items= get_states(list)
           long =length(list);
           if long==0
                items={'All'};
           else
                i=0;
                state = list.Head;
                while ~isempty(state)
                    i = i+1;
                    items {i} =char(state.get_state_name);
                    state = state.Next;
                end    
           end
        end
        
        function list = default(list)
            list.Country_Name = "Default";
            list.Head = [];
            list.Tail = [];
            list.Length = 0;
        end
        
        function insert_st(list)
            list.Head
        end
        
        function delete(list)
            while ~isempty(list.Head)
                list.Head.delete();
            end
        end
              
        function remove(list,node)
            if isempty(node) || node.Country ~= list
                error('state is not in the country');
            end
            if ~isempty(node.Prev)              % If a node precedes the current node,
                node.Prev.Next = node.Next;     % make preceding node point to the node
            else                                % that follows the current node,
                list.Head = node.Next;          % else make Head point to it.
            end                                 
            if ~isempty(node.Next)              % If a node follows the current node,
                node.Next.Prev = node.Prev;     % make its prev point to the node that
            else                                % that precedes the current node
                list.Tail = node.Prev;          % else make previous node be the tail.
            end
            list.Length = list.Length - 1;      
            node.Next = [];
            node.Prev = [];
            node.Country = [];
        end % remove
                
        
        function insert(list,node)
            if ~isempty(node.Country)
                if node.Country ~= list           % New node is in another list, 
                    node.Country.remove(node);    % so we need to remove it.
                else
                    return;                     % New node is already in this list,
                end                             % so do nothing.Not sure if this works
            end
            if list.Length == 0                 % If the list is empty,
                list.Head = node;               % put new node at the head,
            else
                list.Tail.Next = node;          % else, point tail node at it.
            end
            node.Next = [];                     % New node is at the end.
            node.Prev = list.Tail;              % Previous node is old tail node.
            list.Tail = node;                   % Make Tail node point at new node.
            list.Length = list.Length + 1;      
            node.Country = list;                  
        end % insert
        
        function disp(list)
            item = list.Head;
            while ~isempty(item)
                item.disp
                item = item.Next;
            end
        end
        
        
        
        
    end

end