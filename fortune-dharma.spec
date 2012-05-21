Name:		fortune-dharma
Version:	1.1
Release:	1%{?dist}
Summary:	Dharma fortunes

Group:		Amusements/Games
License:	BSD + other
URL:		https://github.com/vbatts/fortune-dharma
Source0:	fortunes/37_practises_of_bodhisattvas.txt
Source1:	fortunes/8_verses_for_training_the_mind.txt
Source2:	fortunes/dhammapada.txt
Source3:	fortunes/eightfold.txt
Source4:	fortunes/misc.txt
Source5:	fortunes/truths.txt

Requires:	fortune-mod

BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:	noarch
BuildRequires:	%{_sbindir}/strfile

%description
Bringing dharma teachings, to your fortune cookies :)

%prep
%setup -q


%build
# maybe someone can tell me why rpmbuild fails without this
cp fortunes/*.txt ../../SOURCES/
make

%install
pwd
rm -rf $RPM_BUILD_ROOT
make install fortunedir=%{_datadir}/games/fortune DESTDIR=$RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%{_sysconfdir}/profile.d/dharma-login-fortune.csh
%{_sysconfdir}/profile.d/dharma-login-fortune.sh
#%{_datadir}/games/fortune/
%{_datadir}/games/fortune/37_practises_of_bodhisattvas
%{_datadir}/games/fortune/37_practises_of_bodhisattvas.dat
%{_datadir}/games/fortune/8_verses_for_training_the_mind
%{_datadir}/games/fortune/8_verses_for_training_the_mind.dat
%{_datadir}/games/fortune/dhammapada
%{_datadir}/games/fortune/dhammapada.dat
%{_datadir}/games/fortune/dharma
%{_datadir}/games/fortune/dharma.dat
%{_datadir}/games/fortune/eightfold
%{_datadir}/games/fortune/eightfold.dat
%{_datadir}/games/fortune/misc
%{_datadir}/games/fortune/misc.dat
%{_datadir}/games/fortune/truths
%{_datadir}/games/fortune/truths.dat

%changelog
* Mon May 21 2012 Vincent Batts <vbatts@redhat.com> 1.1-1
- new package built with tito


