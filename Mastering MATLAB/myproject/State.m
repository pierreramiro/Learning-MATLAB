classdef State < LinkedNode
    properties
        State_Name (1,1) string
        Cases_acum      double
        Cases_daily     double
        Deaths_acum     double
        Deaths_daily    double
    end
    methods
        function obj = State (sname,ncases_ndeaths) %constructor
            arguments
                sname='No State'
                ncases_ndeaths ={}
            end
            obj.State_Name = sname;
            ncases_acum = zeros(1,length(ncases_ndeaths));
            ndeaths_acum = ncases_acum;
            ncases_day = ncases_acum;
            ndeaths_day = ncases_acum;
            for i=1:length(ncases_ndeaths)
                ncases_acum (i)= ncases_ndeaths{i}(1);
                ndeaths_acum (i)= ncases_ndeaths{i}(2);
                if i <2
                    ncases_day (i) =ncases_acum (i);
                    ndeaths_day (i)=ndeaths_acum (i);
                else
                    if ncases_acum(i) < ncases_acum(i-1)
                        ncases_acum(i)=ncases_acum(i-1);
                    end
                    if ndeaths_acum(i) < ndeaths_acum(i-1)
                        ndeaths_acum(i)=ndeaths_acum(i-1);
                    end
                    ncases_day (i) = ncases_acum(i)-ncases_ndeaths{i-1}(1);
                    ndeaths_day (i) = ndeaths_acum(i) - ncases_ndeaths{i-1}(2);
                end
            end
            obj.Cases_acum = ncases_acum;
            obj.Deaths_acum = ndeaths_acum;
            obj.Cases_daily = ncases_day;
            obj.Deaths_daily = ndeaths_day;
        end
        function sname =get_state_name(obj)
            sname = obj.State_Name;
        end
        function [vcases,vdeaths]= get_cases_and_deaths(obj,Flag)
            if isequal(Flag,'A')
                vcases = obj.Cases_acum;
                vdeaths = obj.Deaths_acum;
            elseif isequal(Flag,'D')
                vcases = obj.Cases_daily;
                vdeaths = obj.Deaths_daily;
            end
        end
        function set.Cases_acum(obj,ncases)
            obj.Cases_acum = ncases;
        end
        function set.Deaths_acum(obj,ndeaths)
            obj.Deaths_acum = ndeaths;
        end
        function set.Cases_daily(obj,ncases)
            obj.Cases_daily = ncases;
        end
        function set.Deaths_daily(obj,ndeaths)
            obj.Deaths_daily = ndeaths;
        end
        
        function set.State_Name(obj,sname)
            obj.State_Name = sname;
            obj.reposition();
        end
        
        function disp(node)
            if ~isempty(node.Country)
                fprintf('State:\t\t%s\nCountry:\t%s\n',node.State_Name,node.Country.Country_Name);
            else
                fprintf('State:\t\t%s\n',node.State_Name);
            end
        end
        function a = gt(o1,o2)
            a = o1.State_Name() > o2.State_Name();
        end
        function a = ge(o1,o2)
            a = o1.State_Name() >= o2.State_Name();
        end
        function a = lt(o1,o2)
            a = o1.State_Name() < o2.State_Name();
        end
        function a = le(o1,o2)
            a = o1.State_Name() <= o2.State_Name();
        end
        function a = eq(o1,o2)
            a = o1.State_Name() == o2.State_Name();
        end
        function a = ne(o1,o2)
            a = o1.State_Name() ~= o2.State_Name();
        end
        
    end
end