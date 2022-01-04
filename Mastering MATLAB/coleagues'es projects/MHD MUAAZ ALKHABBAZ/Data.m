classdef Data
    %in this class i will define all importants data from the file (covid_data)
    %then can i use this data in the cod of appdesigner for the finla
    %project
    
    properties
        CovidData
        Date
        Country
        Country_index
        state
        state_index
        
    end
    
    methods
        function obj=Data(in)
          load 'covid_data.mat' covid_data
          obj.CovidData=covid_data;
          obj.Country=covid_data(1:end,1);
          obj.Date=covid_data(1,3:end);
          obj.Country{1}='Global';
          [~,n]=ismember(obj.Country,in);%the answer is a vector with zeros and ones (but not logical array)
          [~,obj.Country_index]=max(n); %This gives the index of the first 1 (The searched Country)
          obj.state_index=obj.Country_index:(obj.Country_index+sum(n)-1);
          obj.state=covid_data(obj.state_index,2);
          obj.state{1}='All';
          
          
           end
         
        
        
        %function to make the casevector for reach index (Country /and State)
        function obj=Case_Vector (obj,inc)
          CasesV=zeros(1,length(obj.Date));
            
            for k=3:length(obj.Date)+2
                CasesV(k-2)=obj.CovidData{inc,k}(1,1);
           end
            obj=CasesV;
        end
         %function to make the Deathvector for reach index (Country /and State)
        function obj=Death_Vector (obj,ind)
           DeathV=zeros(1,length(obj.Date));
            
            for kk=3:length(obj.Date)+2
                DeathV(kk-2)=obj.CovidData{ind,kk}(1,2);
            end
            obj=DeathV;
        end
         %function to compute the Globalcases and GlobalDeaths
        function obj=Global_Cases_And_Deaths(obj)
            states=obj.CovidData(:,2);
            All=zeros(1,length(states));
            
            GlobalCases=zeros(length(states),length(obj.Date));
            GlobalDeath=zeros(length(states),length(obj.Date));
            %the vector All contains nonzeros by emptycell and zeros by
            %cells with names of states
            for n1=1:length(states)
                if isempty(states{n1})
                    All(n1)=n1;
                end
            end
            %Creating matrxes for store cases and Deathes of all
            %Countries(just where we have emptycell by statescolumn-All-)
            for n2=1:length(states)
                if All(n2)==0
                    continue;
                else
                    for n3=3:length(obj.Date)+2
                        GlobalCases(n2,n3-2)=obj.CovidData{n2,n3}(1,1);
                        GlobalDeath(n2,n3-2)=obj.CovidData{n2,n3}(1,2);
                    end
                end
                
            end
            %The object is matrix with tow rows
            %the first row contains the sum of cases for each day
            %The second row contains the sum of Deaths for each day
            obj=[sum(GlobalCases);sum(GlobalDeath)];
                    
            
                    end
                end
end
            
            
        
    

