# Runs Sample files
#!/bin/bash

# project path defaults to the "ramlstyle" local project path
_project_path=`pwd`
# sample path defaults to project_dir/samples
_sample_path="${_project_path}/samples"
# filter files to process
_sample_files="${_sample_path}/*.raml"

# default path to the output html files
_output_path="${_project_path}/output/*.html"
# optional bit to open output html files in a browser
_open_output="0"

# output report
_output_report="${_project_path}/output/report.html"
_open_report="1"

printf "parsing raml sample files: ${_sample_files}\n"
for f in ${_sample_files}
do
    #printf "parsing sample file: ${f}\n"
    bundle exec bin/ramlstyle -o output "${f}"
done
if [ "${_open_output}" -eq "1" ];
then
    printf "opening output files: ${_output_path}\n"
    for output_file in ${_output_path}
    do
        printf "opening output file: ${output_file}\n"
        open "${output_file}"
    done
fi
if [ "${_open_report}" -eq "1" ];
then
    printf "opening output report: ${_output_report}\n\n"
    open "${_output_report}"
fi
