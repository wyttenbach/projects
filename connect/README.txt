https://www.ibm.com/docs/en/app-connect/12.0?topic=solutions-creating-bar-file

https://www.ibm.com/docs/en/app-connect/12.0?topic=file-adding-resources-bar

[mqm@vaausvrsapp90 u01]$ find . -name '*.bar' | grep -i d2d | grep 526 | xargs ls -l
-rwxrwxrwx. 1 mqm mqm 179184 Aug  8  2023 ./downloads/viers_bar_files/08082023/ViersD2D526EZFormService_V6_v5_1_1_0_20230808_032741.bar
-rwxrwxrwx. 1 mqm mqm 164603 May 17  2023 ./downloads/viers_bar_files/ViersD2D526EZFormService_V4_v5_10_1_1_20220708_083952.bar
-rwxrwxrwx. 1 mqm mqm 165030 May 17  2023 ./downloads/viers_bar_files/ViersD2D526EZFormService_V5_v5_11_2_0_20220708_084711.bar
[mqm@vaausvrsapp90 u01]$

