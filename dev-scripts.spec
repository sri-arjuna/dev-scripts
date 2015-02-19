Name:        dev-scripts
Version:     0.3.5
Release:     1%{?dist}
Summary:     A collection of scripts for developers

License:     GPLv3
URL:         https://github.com/sri-arjuna/dev-scripts
##Source0:     https://github.com/sri-arjuna/dev-scripts/archive/master.zip
Source0:     http://sea.fedorapeople.org/review/%{name}/%{name}-%{version}.tar.gz

BuildArch:   noarch

Requires:    tui
# Live Image
Requires:    spin-kickstarts
Requires:    livecd-tools
Requires:    awesome-kickstarts
# Developer
Requires:    rpmdevtools
Requires:    rpm-build
Requires:    mock
Requires:    html5-gen
Requires:    createrepo
# Code handling
Requires:    git
Requires:    gcc
Requires:    auto-buildrequires
Requires:    make

	
%description
A collection of scripts that aims to make a developers life easier
* ssh
* rpm
* repo
* compile
* mock
* livecd-creator
* git


%prep
%setup -q -c %{name}-%{version}

%build
# nothing to do

%install
rm -rf       %{buildroot}
#rm %{name}/install.sh \
#	%{name}/uninstall.sh \
#	%{name}/README.md \
#	%{name}/build-rpm-%{name}.sh \
	#%{name}/%{name}.spec
mkdir -p     %{buildroot}%{_bindir} \
             %{buildroot}%{_mandir}/man1 \
             %{buildroot}%{_datarootdir}/%{name} \
	     %{buildroot}%{_sysconfdir}/bash_completion.d/
# Move docs
mv %{name}/man/*        %{buildroot}%{_mandir}/man1/
rm -fr %{name}/man
rm -fr %{name}/.git

mv %{name}/%{name}_compl.bash %{buildroot}%{_sysconfdir}/bash_completion.d/

# Last step
mv %{name}/*            %{buildroot}%{_datarootdir}/%{name}/
cd %{buildroot}
ln -sf %{_datarootdir}/%{name}/ds.sh  %{buildroot}%{_bindir}/ds 

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)   
%doc %{_mandir}/man1/%{name}.1.gz
%doc %{_mandir}/man1/ds*.1.gz
%{_sysconfdir}/bash_completion.d/%{name}*
%{_datarootdir}/%{name}/
%{_bindir}/ds


%changelog
* Sun Feb 15 2015 - Simon A. Erat - erat.simon@gmail.com - 0.3.5
- Updated:    ds prj <ks,mock,rpm> make
- Updated:    ds prj rpm list

* Wed Feb 11 2015 - Simon A. Erat - erat.simon@gmail.com - 0.3.4
- Updated:    ds prj <git,ks,mock,rpm> add
- Updated:    ds prj rpm list
- Added:      ds prj rpm unpack

* Thu Feb 05 2015 - Simon A. Erat - erat.simon@gmail.com - 0.3.3
- Updated:  ds prj rpm list <lbl> <tmpfile>, should work better now

* Fri Jan 30 2015 - Simon A. Erat - erat.simon@gmail.com - 0.3.2
- Updated:  ds prj ks make, failsafe value is now 1  instead of -1

* Mon Jan 19 2015 - Simon A. Erat - erat.simon@gmail.com - 0.3.2
- Updated: ds prj ks make, properly moves the iso files now
- Updated: ds prj git make, should git clone if project is not found,
-                           text on skipping
- Updated: ds prj rpm make, text arrangement for build update
- Changed: spec requirements

* Sun Jan 11 2015 - Simon A. Erat - erat.simon@gmail.com - 0.3.1
- Updated: ds prj rpm make (lbl)
- Updated: ds prj ks make (lbl)

* Tue Dec 30 2014 - Simon A. Erat - erat.simon@gmail.com - 0.3.0
- Added mock (add,make)
- Added git (make - remoteonly)
- Updated 'ds setup' for mock

* Sat Nov 29 2014 - Simon A. Erat - erat.simon@gmail.com - 0.2.2
- Setup hopefully stable now.. rearanged sourced files

* Wed Nov 26 2014 - Simon A. Erat - erat.simon@gmail.com - 0.2.1
- tui-browser passes arguments properly now
- 'make' scripts handle passed arguments properly now
- 'make' scripts ask for review logfile only if non-verbose (default)
- removed some old remains and accidently included temp-files

* Wed Nov 26 2014 - Simon A. Erat - erat.simon@gmail.com - 0.2.0
- Check if tui-browser passes arguments properly

* Sun Nov 16 2014 - Simon A. Erat - erat.simon@gmail.com - 0.2.0
- Added bash completition

* Mon Nov 03 2014 - Simon A. Erat - erat.simon@gmail.com - 0.1.0
- Provided functions seem stable

* Fri Oct 31 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.6
- improved git, rpm
- added kickstart/livecd module
- fixed requires list

* Tue Oct 28 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.5
- Added manpage
- Hotfix manpage

* Thu Sep 18 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.3
- git and rpm modules (add,make,edit) seem stable... 

* Thu Sep 18 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.2
- Devel stage

* Thu Sep 18 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.1
- Initial package

