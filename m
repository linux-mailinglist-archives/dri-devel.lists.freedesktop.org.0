Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E713BCA0E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5AC89E32;
	Tue,  6 Jul 2021 10:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C36389E14;
 Tue,  6 Jul 2021 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=eO0X2dxTENjGPuJ76Tjdry0CigxXgCvGPfL7EUF+NQg=; 
 b=kJoF35Cvfr+nP3bkbhXpFyyKa8F6QWTSgvE3mxi2+ZRjpGZ4QfqFi6pbk2Yc8Np14ETRyHZKESGmIWEzCmFi9/ciI0wQ1FJwJF1V7I7BClhV5hfW1oc3/v7FVDPyEk5pzC9Pmmyf5SgoFxt9BIgZmJySh1c4bGLuNbGN83RztYcnXi3DwgeSeN2h0BiTgxR3//cFNIiWc+JLzQPr9BR5wfMvL+3/HbLFROBVQL/hPYwOtsMqInSiwYGoKWf6paUji+//x1fjGyuyZuwkU9TOIhN6omkgZgKcycbFBEfivzcdGpSUtt7fHXz7w4eBk6ezhm+Opb9ppp4mIMB98hvi0w==;
Received: from 152.red-88-9-105.dynamicip.rima-tde.net ([88.9.105.152]
 helo=[192.168.2.220]) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m0iQA-0006Cl-9r; Tue, 06 Jul 2021 12:35:18 +0200
Message-ID: <e5c5331a680da672aa850604527f2ef8f23a0556.camel@igalia.com>
Subject: Re: [Mesa-dev] XDC 2021: Registration & Call for Proposals now open!
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
Date: Tue, 06 Jul 2021 12:35:08 +0200
In-Reply-To: <c40f6f761610aa2c8076cac1dda87844af96c7ad.camel@igalia.com>
References: <790BA4EE-E3F0-40B9-BE18-3646492F1CAE@intel.com>
 <380e8cb0f18c6f4b21c20b382668316b8962159a.camel@igalia.com>
 <0032ceefa7c39bdd03907565ab9762ad6007eb80.camel@igalia.com>
 <c40f6f761610aa2c8076cac1dda87844af96c7ad.camel@igalia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-jzTYU/+fjqNUHUXyrwxJ"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--=-jzTYU/+fjqNUHUXyrwxJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-07-06 at 09:38 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> Hi!
>=20
> We have decided to extend the Call for Proposals until September 1st
> or
> until we will all the available talk slots, whichever occurs first.
>=20
> Remember that talks will get accepted by order of submission. If you
> are thinking on proposing a talk for XDC, do it as soon as possible.
>=20

Due to the overwhelming last minute response, we have filled all the
pending slots for full and half-slot talks. Thanks a lot!

Therefore, we close the CfP for full and half-slot talks. However, we
stil welcome proposals for workshops, demos and lightning talks...
Don't forget to submit yours!

Sam

> Thanks,
>=20
> Sam
>=20
> On Sat, 2021-06-26 at 08:35 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> > One week!
> >=20
> > Don't forget to submit your proposals!
> >=20
> > Sam
> >=20
> > On Tue, 2021-06-08 at 12:38 +0200, Samuel Iglesias Gons=C3=A1lvez wrote=
:
> > > Kind reminder. Deadline is Sunday, 4 July 2021 :-)
> > >=20
> > > Sam
> > >=20
> > > On Thu, 2021-05-20 at 10:01 +0000, Szwichtenberg, Radoslaw wrote:
> > > > Hello!
> > > > =C2=A0
> > > > Registration & Call for Proposals are now open for XDC 2021,
> > > > which
> > > > will
> > > > take place on September 15-17, 2021. This year we will repeat
> > > > as
> > > > virtual event.
> > > > =C2=A0
> > > > https://indico.freedesktop.org/event/1/
> > > > =C2=A0
> > > > As usual, the conference is free of charge and open to the
> > > > general
> > > > public. If you plan on attending, please make sure to register
> > > > as
> > > > early
> > > > as possible!
> > > > =C2=A0
> > > > In order to register as attendee, you will therefore need to
> > > > register
> > > > via the XDC website. As XDC moved to a new Indico
> > > > infrastructure,
> > > > if
> > > > you previously registered on the XDC website, you need to
> > > > create
> > > > a
> > > > new
> > > > account again.
> > > > =C2=A0
> > > > https://indico.freedesktop.org/event/1/registrations/1/
> > > > =C2=A0
> > > > In addition to registration, the CfP is now open for talks,
> > > > workshops
> > > > and demos at XDC 2021. While any serious proposal will be
> > > > gratefully
> > > > considered, topics of interest to X.Org and freedesktop.org
> > > > developers
> > > > are encouraged. The program focus is on new development,
> > > > ongoing
> > > > challenges and anything else that will spark discussions among
> > > > attendees in the hallway track.
> > > > =C2=A0
> > > > We are open to talks across all layers of the graphics stack,
> > > > from
> > > > the
> > > > kernel to desktop environments / graphical applications and
> > > > about
> > > > how
> > > > to make things better for the developers who build them. Head
> > > > to
> > > > the
> > > > CfP page to learn more:=C2=A0
> > > > =C2=A0
> > > > https://indico.freedesktop.org/event/1/abstracts/
> > > > =C2=A0
> > > > The deadline for submissions is Sunday, 4 July 2021.
> > > > =C2=A0
> > > > Last year we modified our Reimbursement Policy to accept
> > > > speaker
> > > > expenses for X.Org virtual events like XDC 2021. Check it out
> > > > here:
> > > > =C2=A0
> > > > https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/
> > > > =C2=A0
> > > > If you have any questions, please send me an email to
> > > > radoslaw.szwichtenberg@intel.com,=C2=A0=C2=A0adding on CC the X.org=
 board
> > > > (board
> > > > at foundation.x.org).
> > > > =C2=A0
> > > > And don't forget, you can follow us on Twitter for all the
> > > > latest
> > > > updates and to stay connected:
> > > > =C2=A0
> > > > =C2=A0
> > > > https://twitter.com/XOrgDevConf
> > > > =C2=A0
> > > > Best,
> > > > =C2=A0
> > > > Radek
> > > > =C2=A0
> > > > P.S: a DNS redirection (xdc2021.x.org) is work in progress.
> > > > Please
> > > > use
> > > > the mentioned links for the moment.
> > > > =C2=A0
> > > > =C2=A0
> > > > Rados=C5=82aw Szwichtenberg
> > > > -------------------------------------------------
> > > > Intel Technology Poland sp. z o.o.
> > > > ul. Slowackiego 173, 80-298 Gdansk
> > > > KRS 101882 - NIP 957-07-52-316
> > > > =C2=A0
> > > > _______________________________________________
> > > > mesa-dev mailing list
> > > > mesa-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> > >=20
> > > _______________________________________________
> > > mesa-dev mailing list
> > > mesa-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> >=20
> > _______________________________________________
> > mesa-dev mailing list
> > mesa-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>=20
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev


--=-jzTYU/+fjqNUHUXyrwxJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAmDkMdwACgkQf/S6MvF9
w0PDng/+JI0yNYCicuRjVkocfF5HSgCeuTIqm7OZoUDBk71JFfleOOP/sSLNzd7k
AFoS5j4jeTQ4Tw3DZZ16fNMMMid+GzK7bJm/ouY9Uo3L8vk41ua0VjG43rffKYxm
xuoi9OTNlK0e02IoNcOhetypYRFnOsO07m5dJBg0JvOj3Aj7K9ri9CpFzGdN+VrZ
RIYuar3exYS3buWBNbntINhrp4F3x+1qq+WsntUgGbXH0fMbOk43xsuA1C+6YS7f
y4DsON9yCGBGTNvS6FBzjPgkjQJJxjqYxk2mke092Ak6ud0WPX/pBQ/bDWVWrG/r
Wr0DZXBLwkMqvHWrdR7/vCVqElWpDf0zkTiIIeh1qi/iqdi+sxX1VhrA+PNgbOrZ
fFLVQ50puX+y8OdqM9gvwsK4LB4CbOPUw0ZLK/Ke+dNbhrMPojx15bN3Oyz+ZGUD
tJPeBkIS6Aq6KCpiL6QkatjpeoXyRotWnYKShp3IVynNe/l0b3K62JP/fV6iOcWr
wqaGLZGKczCTaiuQD/Mx3g4s4tc7LdfmAt58z9NyibYDp2k8dJzr0i7BwCFcwPyG
6jbItBcc+53TtjxcT21aadAncnVD/50P572NmDagyYpdCKk11Yd3PE6HxdJsf8YX
U/jujZFRO9eW8kdmYtiy1j2EKEEfrNEOv447e+6iOo1rs7lX47k=
=+Ggb
-----END PGP SIGNATURE-----

--=-jzTYU/+fjqNUHUXyrwxJ--

