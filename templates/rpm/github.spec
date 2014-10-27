#!/bin/bash
source /etc/profile.d/tui.sh

cat > "$DEST" << EOF
Name:        $APP
Version:     0.0.0
Release:     0%{?dist}
Summary:     

License:     GPLv3
URL:         https://github.com/sri-arjuna/tui
Source0:     https://github.com/sri-arjuna/tui/archive/master.zip
Source0:     http://sea.fedorapeople.org/review/%{name}/%{name}-%{version}.tar.gz

BuildArch:   noarch

Requires:    coreutils

%description
This package does

%prep
%setup -q -c %{name}-%{version}

%build
# nothing to do

%install
rm -rf       %{buildroot}
rm %{name}/install.sh \
	%{name}/uninstall.sh \
	%{name}/README.md \
	%{name}/build-rpm-%{name}.sh \
#	config.etc/color-org.conf \
#	%{name}/config.etc/status-org.conf \
	#%{name}/tui.spec
mkdir -p     %{buildroot}%{_bindir}/ \
                     %{buildroot}%{_mandir}/man1 \
                     %{buildroot}%{_sysconfdir}/%{name}/ \
                     %{buildroot}%{_sysconfdir}/profile.d/ \
                     %{buildroot}%{_datarootdir}/%{name}/templates \
                     %{buildroot}%{_docdir}/%{name}
mv %{name}/bin/*              %{buildroot}%{_bindir}/
mv %{name}/conf/*             %{buildroot}%{_sysconfdir}/%{name}/
mv %{name}/templates/*        %{buildroot}%{_datarootdir}/%{name}/templates/
mv %{name}/docs/*             %{buildroot}%{_docdir}/%{name}
mv %{name}/man/*.1            %{buildroot}%{_mandir}/man1/
mv %{name}/profile.d/%{name}.sh   %{buildroot}%{_sysconfdir}/profile.d/

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)   
%doc %{_docdir}/%{name}/
%{_mandir}/man1/%{name}*.1.gz
%{_datarootdir}/%{name}/
%{_bindir}/%{name}
#%{_sysconfdir}/%{name}/
#%{_sysconfdir}/profile.d/%{name}.sh

%config
%{_sysconfdir}/%{name}/
%{_sysconfdir}/profile.d/%{name}.sh


%changelog
* $(date +'%a %b %d %Y') - $TUI_USER_NAME - $TUI_USER_EMAIL - VERSION
- Initial Release
EOF
