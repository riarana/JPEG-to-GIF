
[file_name file_path]=uigetfile({'*.jpeg;*.jpg;'},'Select Images','multiselect','on');
[file_name2 file_path2]=uiputfile('*.gif','Location to save as animated GIF',file_path);
loops= 4
delay= 3

for i = 1:length(file_name)
    if strcmpi('gif',file_name{i}(end-2:end))
        [M  c_map]=imread([file_path,file_name{i}]);
    else
        a=imread([file_path,file_name{i}]);
        [M  c_map]= rgb2ind(a,256);
    end
    
    if i==1
        imwrite(M,c_map,[file_path2,file_name2],'gif','LoopCount',loops,'DelayTime',delay)
    else
        imwrite(M,c_map,[file_path2,file_name2],'gif','WriteMode','append','DelayTime',delay)
    end

end 

% when run, program will take in upto 20 files from local machine and ask for 
% desired location to save GIF. 

