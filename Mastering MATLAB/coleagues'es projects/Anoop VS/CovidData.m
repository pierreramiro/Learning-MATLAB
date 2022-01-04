% Class CovidData is derived from the built-in abstract class: dynamicprops
%
% (dynamicprops is a subclass of handle class.Subclasses of dynamicprops
% can have dynamic properties:Properties which can be used to assign data
% which one want to associate with a particular instance of class, 
% but not all objects of that class)
%
% A = CovidData creates an instance with empty properties:
%   CumulativeCases
%   Cumulativedeaths
%
% In order to populate A with data, use A.ComputeGlobalData()
% A will then contain the following properties:
%   DateList         - cell array of dates for which data is available
%   CumulativeCases  - Global cumulative cases for each day in DateList
%   CumulativeDeaths - Global cumulative deaths for each day in DateList
%   Country          - Vector of Countires each with properties
%       (all data are associated with the particular Country)
%       Name             - Name
%       CumulativeCases  - Cumulative Cases for each day in DateList
%       CumulativeDeaths - Cumulative Cases for each day in DateList
%       State            - Vector of states each with properties
%           (all data are associated with the particular state)
%           Name             - Name
%           CumulativeCases  - Cumulative Cases for each day in DateList
%           CumulativeDeaths - Cumulative Cases for each day in DateList


classdef CovidData < dynamicprops
    properties
        CumulativeCases
        CumulativeDeaths
    end
    
    methods 
        function obj = CovidData()
                obj.CumulativeCases = [];
                obj.CumulativeDeaths = [];
        end
 
        function obj = ComputeGlobalData(obj)
            load covid_data.mat covid_data;
            % Add DateList to Global Object
            obj.addprop('DateList');
            obj.DateList = covid_data(1,3:end);
            % Global cumulative Cases and Deaths
            I = cellfun(@isempty, covid_data(:,2));
            AllData = covid_data(I,3:end);
            CasesDeaths = cell(1, size(AllData,2));
            for i = 1:size(AllData,2)
                mat = cell2mat(AllData(:,i));
                CasesDeaths{i} = sum(mat);
            end
            CasesDeaths = cell2mat(CasesDeaths'); 
            obj.CumulativeCases = CasesDeaths(:,1)';
            obj.CumulativeDeaths = CasesDeaths(:,2)';
            % Construct Country Objects
            obj.ConstructCountryObjects(covid_data(2:end,:));
        end
        
        function ConstructCountryObjects(obj, data)
            % Add property 'Country' to the object
            obj.addprop('Country');
            % Create vector of Country objects
            countries = unique(data(1:end,1));
            n = length(countries);
            C(1,n) = CovidData;
            obj.Country = C;
            % Populate vector of Country objects
            for i = 1:n
                % Add property 'Name' (stores the name of the country)
                obj.Country(i).addprop('Name');
                obj.Country(i).Name = countries{i};
                % Cumulative cases and Deaths for the given country
                I = strcmp(data(:,1),countries{i});
                CountryData = data(I,2:end);
                CD = CountryData(1,2:end);
                CD = cell2mat(CD');
                obj.Country(i).CumulativeCases = CD(:,1)';
                obj.Country(i).CumulativeDeaths = CD(:,2)';
                % Construct State Objects for the given country
                obj.Country(i).ConstructStateObjects(CountryData);
            end
        end
        
        function ConstructStateObjects(obj, data)
            % Add property 'State' to country object
            obj.addprop('State');
            % If State wise data is not available
            if size(data,1) == 1 
                obj.State = [];
            % Create and popualate vector of State objects
            else
                % Create vector of States
                States = data(2:end,1);
                n = length(States);
                S(1,n) = CovidData;
                obj.State = S;
                % Populate State objects
                for i = 1:n
                    % Add property 'Name' (Stores the name of State)
                    obj.State(i).addprop('Name');
                    obj.State(i).Name = States{i};
                    % Cumulative cases and deaths for the given State
                    StateData = data(strcmp(data(1:end,1),States{i}),2:end);
                    StateData = cell2mat(StateData');
                    obj.State(i).CumulativeCases = StateData(:,1)';
                    obj.State(i).CumulativeDeaths = StateData(:,2)';
                end
            end 
        end
        
    end
    
end