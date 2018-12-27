
% takes MODIS files with name "sur_refl_bol" and converts them into .jpg files
for n = 1:20
[baseName, folder] = uigetfile(); 
fullFileName = fullfile(folder, baseName)
b1 = double(hdfread(fullFileName, 'sur_refl_b01')); 
b2 = double(hdfread(fullFileName, 'sur_refl_b02'));
ndvi = (b2-b1)./(b2+b1); 
imshow(ndvi)
filename = [(baseName(1:end-4)),'.jpg']
saveas(gcf,fullfile(folder, 'data_jpegs',[filename]))
end