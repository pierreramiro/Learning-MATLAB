classdef State < handle
    properties
        StateName
        CaseCount
        DeathCount
   end
    methods
        function obj = State(name,cc,dc)
            obj.StateName = name;
            obj.CaseCount = cc;
            obj.DeathCount = dc;
        end
    end
end