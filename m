Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A42206D22
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B008961D;
	Wed, 24 Jun 2020 06:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9238A6E081;
 Tue, 23 Jun 2020 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=Kzlg3bHRorDD7BWffZJv6GE9TJPKF3y/v/amkqlv3GY=; 
 b=Aa5RZQ61Gr35Q9a7feARdpIBKBsBfXEzl4lNWlIFxFMSiigV830bNRBv9SrGb+DYg7WK4SGf4Q+HM/0DDj3K4Dc8K6i5te0h3BlsqZy1/n2G5aGhfmwbe/NH4spRpJoV80nUlOjWU0ja8SeBmTVIZYJJYWl2mm6WgA305MXx3vhGIS9oC9O4JCeiaWB6q7orEP2X7WW3mCRtIJQMOMqAoVV23wJYTEDCMEjyM94FDCnUbQ47WpNUj3pbty0pVwhMVkcCpHVUBbyCYXdCDyq+SGtPl6t0i5vgjsiUjsTmmLY7FD+TnA/V9Pz63DUOgBctFgF0maao6LvbspBiSo5vcQ==;
Received: from 53.red-88-15-141.dynamicip.rima-tde.net ([88.15.141.53]
 helo=maxwell) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jndN9-0003TO-IZ; Tue, 23 Jun 2020 09:29:35 +0200
Message-ID: <78d5ab87f0dfb7e3e1286a5f3f4f10fefa33e077.camel@igalia.com>
Subject: Re: [Mesa-dev] XDC 2020: Registration & Call for Proposals now open!
From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>
To: "Szwichtenberg, Radoslaw" <radoslaw.szwichtenberg@intel.com>, 
 "events@lists.x.org"
 <events@lists.x.org>, "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org"
 <mesa-dev@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "etnaviv@lists.freedesktop.org"
 <etnaviv@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Tue, 23 Jun 2020 09:29:25 +0200
In-Reply-To: <9a4392829de747a9a752a5b13f31f90b@intel.com>
References: <9a4392829de747a9a752a5b13f31f90b@intel.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jun 2020 06:58:05 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "board@foundation.x.org" <board@foundation.x.org>
Content-Type: multipart/mixed; boundary="===============0045536624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0045536624==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-9+orxlxz86sWcnKf/R+o"


--=-9+orxlxz86sWcnKf/R+o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This is a kindly reminder that the CFP deadline is in less than two
weeks :)

On Fri, 2020-05-15 at 14:15 +0000, Szwichtenberg, Radoslaw wrote:
> Hello!
>=20
> Registration & Call for Proposals are now open for XDC 2020, which
> will
> take place at the Gda=C5=84sk University of Technology in Gda=C5=84sk, Po=
land
> on September 16-18, 2020.
>=20
> Thanks to LWN.net for hosting the website again this year!
>=20
>     https://xdc2020.x.org
>    =20
> As usual, the conference is free of charge and open to the general
> public. If you plan on attending, please make sure to register as
> early as possible! However, don't book any travel or hotel until the
> organization decides if we keep the conference as it is or there is
> any change. Please read this message on the website for more
> information:
>=20
> https://xdc2020.x.org/event/9/page/78-covid-19
>=20
> In order to register as attendee, you will therefore need to register
> via the XDC
> website. However, as XDC is sharing the same Indico infrastructure as
> LPC, if you previously registered on the LPC website
> (linuxplumbersconference.org) or on the XDC 2019 website
> (xdc2019.x.org), then you already have an active account
> and can use the same username & password to login!
>=20
>     https://xdc2020.x.org/event/9/registrations/7/
>=20
> In addition to registration, the CfP is now open for talks, workshops
> and demos at XDC 2020. While any serious proposal will be gratefully
> considered, topics of interest to X.Org and freedesktop.org
> developers
> are encouraged. The program focus is on new development, ongoing
> challenges and anything else that will spark discussions among
> attendees in the hallway track.
>=20
> We are open to talks across all layers of the graphics stack, from
> the
> kernel to desktop environments / graphical applications and about how
> to make things better for the developers who build them. Head to the
> CfP page to learn more:=20
>=20
>     https://xdc2020.x.org/event/9/abstracts/
>=20
> The deadline for submissions is Sunday, 5 July 2020.
>=20
> Notice that the event may end up being postponed, converted to a
> fully online conference, or even a hybrid one (physical event + some
> remote talks). It depends on how COVID-19 situation evolves in the
> different countries and the restrictions we will have at that time.
> Also, some people may decide to skip the physical conference to avoid
> any risk of infection. Because of that, please indicate in your talk
> submission if you prefer to give a remote talk in the case that XDC
> keeps being a physical event this year. Similarly, if you think that
> your talk makes no sense if XDC ends up being a fully-virtual
> conference, please indicate that in the notes of the talk submission.
>=20

We are gathering all the information in order to make a decision at the
beginning of July. Stay tuned [0]!

Sam

[0] https://xdc2020.x.org/event/9/page/78-covid-19

> If COVID-19 situation allows it, we are looking forward to seeing you
> in Gda=C5=84sk! If you have any questions, please send me an email to=20
> radoslaw.szwichtenberg@intel.com,  adding on CC the X.org board
> (board at foundation.x.org).
>=20
> And don't forget, you can follow us on Twitter for all the latest
> updates and to stay connected:
>=20
>     https://twitter.com/xdc2020
>=20
> Best,
>=20
> Radek
>=20
>=20
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>=20

--=-9+orxlxz86sWcnKf/R+o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAl7xr1UACgkQf/S6MvF9
w0OLkA//X2kk/vAbrnL+0CSgFbOfhaOJAhjB2KAGpfsKVdDYKXcRCIgoJE9ZAUDY
HaWB/8mFfZPgfjHbqVQ7qTsQ1bITBHM0uAQ0L0PEgg/qpfaZIW5mI3jwmCWnVaXY
NqgeicXisv2y4Fl+VzZe2qE1GWsnfnfW6NDV3rTUMckNiy1sQ9edF1vuTg1e31NB
hCNy/50FUOR09EZAhjnMl8WfU6HSBxQNGeJK1k34TX7xGmPIjO17v4KmknZohLBd
C441QmBG+144xV3so35CgNbtclyyJArHqUhSgsI9PoQjF6aCpw/1LFN54LPVg+dm
848rSTgIdHNX432Zso605nv+QiU6DWCGX5/5RJ8iR9Nim3WKGZTPgdJfId3EI0BJ
yzxIh/dJvTnoCPyYOUv4nAVdRnpAVtEBxiC4OuNnBo7szzp/qxfM/e6t0Zc6nWkx
1gBTb5uG8JfHA6E534ktRU8INpEbwJnzsFk/GJX2oJ0CsPhhBQyBhtTAbFIDwYNP
gHtJMzVVvp3dnYZfamqdON3fWH7/j75GT8fwGuutM/H17l4dShjKLtDX/+sLwfcn
6dVX7Keg8PeDb6YvJhKAlT0TA2l0kqiKW7td1wkJvwp69Owkc/J81MQ5ky6vmxjT
h/mk6pyEp31lIWNHovnfv21NWIriU7qnEc2FiPQIKsg3NJGb3n4=
=BV8w
-----END PGP SIGNATURE-----

--=-9+orxlxz86sWcnKf/R+o--


--===============0045536624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0045536624==--

