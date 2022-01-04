classdef Country < handle
    properties
        CountryName
        CaseCount
        DeathCount
        States = {}
        Snames = {'All'}
    end
    methods
        function obj = Country(name,cc,dc)
            obj.CountryName = name;
            obj.CaseCount = cc;
            obj.DeathCount = dc;
        end
    end
end