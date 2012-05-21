Name:		fortune-dharma
Version:	1.0
Release:	1%{?dist}
Summary:	Dharma fortunes

Group:		Amusements/Games
License:	BSD + other
URL:		https://github.com/vbatts/fortune-dharma
Source0:	https://github.com/vbatts/fortune-dharma/blob/master/fortunes/37_practises_of_bodhisattvas.txt
Source1:	https://github.com/vbatts/fortune-dharma/blob/master/fortunes/8_verses_for_training_the_mind.txt
Source2:	https://github.com/vbatts/fortune-dharma/blob/master/fortunes/dhammapada.txt
Source3:	https://github.com/vbatts/fortune-dharma/blob/master/fortunes/eightfold.txt
Source4:	https://github.com/vbatts/fortune-dharma/blob/master/fortunes/misc.txt
Source5:	https://github.com/vbatts/fortune-dharma/blob/master/fortunes/truths.txt

Requires:	fortune-mod

BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:	noarch
BuildRequires:	%{_sbindir}/strfile

%description
Bringing dharma teachings, to your fortune cookies :)

%prep
%setup -q


%build
make


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%files
%doc



%changelog

