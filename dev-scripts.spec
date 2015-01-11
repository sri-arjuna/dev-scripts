Name:        dev-scripts
Version:     0.3.0
Release:     41%{?dist}
Summary:     A collection of scripts for developers

License:     GPLv3
URL:         https://github.com/sri-arjuna/dev-scripts
##Source0:     https://github.com/sri-arjuna/dev-scripts/archive/master.zip
Source0:     http://sea.fedorapeople.org/review/%{name}/%{name}-%{version}.tar.gz

BuildArch:   noarch

Requires:    tui
Requires:    awesome-kickstarts
Requires:    spin-kickstarts
Requires:    livecd-tools
Requires:    rpmlint
Requires:    rpmdevtools
Requires:    rpm-build
#Requires:    html5-gen
Requires:    git
Requires:    gcc
Requires:    auto-buildrequires
Requires:    createrepo
	
%description
A collection of scripts that aims to make a developers life easier
* ssh
* rpm
* repo
* compile
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

