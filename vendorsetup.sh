for combo in $(curl https://raw.github.com/iGio90/jellybam_vendor/bam9/bam-build-targets | sed -e 's/#.*$//' | grep bam9 | awk {'print $1'})
do
    add_lunch_combo $combo
done
