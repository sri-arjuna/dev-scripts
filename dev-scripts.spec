Name:        dev-scripts
Version:     0.0.5
Release:     1%{?dist}
Summary:     A collection of scripts for developers

License:     GPLv3
URL:         https://github.com/sri-arjuna/dev-scripts
#Source0:     https://github.com/sri-arjuna/dev-scripts/archive/master.zip
Source0:     http://sea.fedorapeople.org/review/%{name}/%{name}-%{version}.tar.gz

BuildArch:   noarch

Requires:    tui
#Requires:    fas
#Requires:    fedora-packager


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
                     %{buildroot}%{_datarootdir}/%{name}
# Move docs
mv %{name}/man/*        %{buildroot}%{_mandir}/man1/
rmdir %{name}/man
mv %{name}/*                          %{buildroot}%{_datarootdir}/%{name}/
cd %{buildroot}
ln -sf %{_datarootdir}/%{name}/ds.sh  %{buildroot}%{_bindir}/ds 

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)   
%doc %{_mandir}/man1/dev-scripts.1.gz
%doc %{_mandir}/man1/ds*.1.gz
%{_datarootdir}/%{name}/
%{_bindir}/ds


%changelog
* Tue Oct 28 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.5
- Added manpage
- Hotfix manpage

* Thu Sep 18 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.3
- git and rpm modules (add,make,edit) seem stable... 

* Thu Sep 18 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.2
- Devel stage

* Thu Sep 18 2014 - Simon A. Erat - erat.simon@gmail.com - 0.0.1
- Initial package

