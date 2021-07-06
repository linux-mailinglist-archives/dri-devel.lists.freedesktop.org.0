Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2753BC758
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DEA89A20;
	Tue,  6 Jul 2021 07:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36652899C4;
 Tue,  6 Jul 2021 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=yAYLUOcMAjwWlnolJzwB+DdPAkDh6C8nqbU1+Pn7l5g=; 
 b=Kc8ACXNVyfADgALk6R5BDxfPPV62L47V08/3rtScPLoYc4B13+GDXUv5Bh1/4ZONIZqTP4u6tk3jBdncJbekb1ORWmOcHfxTMyE6VUWCI1Cv/GofN+wHkHAzhSRM7GKrIl+ROyuBJgaxYXl2ImzHzv87FwVMA1neIFFXEZ9tRmZ9PgD1Lmv5MKutjNyYihLRhdCKaUGbengm1xaZrQOb5XIgMaCRrjPe+8axRgXBizkukh23yyMTpA+TToKMrXt14HWL1WH55PayuYU9kwI6Dj+Csmp+/+h58LFpav3FLaF/rG+pc7EFcAcnvsYNJnc2w40KS4l4Bdkr3m8+J9e3gQ==;
Received: from 152.red-88-9-105.dynamicip.rima-tde.net ([88.9.105.152]
 helo=[192.168.2.220]) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m0fer-0006eX-By; Tue, 06 Jul 2021 09:38:17 +0200
Message-ID: <c40f6f761610aa2c8076cac1dda87844af96c7ad.camel@igalia.com>
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
Date: Tue, 06 Jul 2021 09:38:07 +0200
In-Reply-To: <0032ceefa7c39bdd03907565ab9762ad6007eb80.camel@igalia.com>
References: <790BA4EE-E3F0-40B9-BE18-3646492F1CAE@intel.com>
 <380e8cb0f18c6f4b21c20b382668316b8962159a.camel@igalia.com>
 <0032ceefa7c39bdd03907565ab9762ad6007eb80.camel@igalia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-JSpHCLgKrKlySHImBZYz"
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


--=-JSpHCLgKrKlySHImBZYz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

We have decided to extend the Call for Proposals until September 1st or
until we will all the available talk slots, whichever occurs first.

Remember that talks will get accepted by order of submission. If you
are thinking on proposing a talk for XDC, do it as soon as possible.

Thanks,

Sam

On Sat, 2021-06-26 at 08:35 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> One week!
>=20
> Don't forget to submit your proposals!
>=20
> Sam
>=20
> On Tue, 2021-06-08 at 12:38 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> > Kind reminder. Deadline is Sunday, 4 July 2021 :-)
> >=20
> > Sam
> >=20
> > On Thu, 2021-05-20 at 10:01 +0000, Szwichtenberg, Radoslaw wrote:
> > > Hello!
> > > =C2=A0
> > > Registration & Call for Proposals are now open for XDC 2021,
> > > which
> > > will
> > > take place on September 15-17, 2021. This year we will repeat as
> > > virtual event.
> > > =C2=A0
> > > https://indico.freedesktop.org/event/1/
> > > =C2=A0
> > > As usual, the conference is free of charge and open to the
> > > general
> > > public. If you plan on attending, please make sure to register as
> > > early
> > > as possible!
> > > =C2=A0
> > > In order to register as attendee, you will therefore need to
> > > register
> > > via the XDC website. As XDC moved to a new Indico infrastructure,
> > > if
> > > you previously registered on the XDC website, you need to create
> > > a
> > > new
> > > account again.
> > > =C2=A0
> > > https://indico.freedesktop.org/event/1/registrations/1/
> > > =C2=A0
> > > In addition to registration, the CfP is now open for talks,
> > > workshops
> > > and demos at XDC 2021. While any serious proposal will be
> > > gratefully
> > > considered, topics of interest to X.Org and freedesktop.org
> > > developers
> > > are encouraged. The program focus is on new development, ongoing
> > > challenges and anything else that will spark discussions among
> > > attendees in the hallway track.
> > > =C2=A0
> > > We are open to talks across all layers of the graphics stack,
> > > from
> > > the
> > > kernel to desktop environments / graphical applications and about
> > > how
> > > to make things better for the developers who build them. Head to
> > > the
> > > CfP page to learn more:=C2=A0
> > > =C2=A0
> > > https://indico.freedesktop.org/event/1/abstracts/
> > > =C2=A0
> > > The deadline for submissions is Sunday, 4 July 2021.
> > > =C2=A0
> > > Last year we modified our Reimbursement Policy to accept speaker
> > > expenses for X.Org virtual events like XDC 2021. Check it out
> > > here:
> > > =C2=A0
> > > https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/
> > > =C2=A0
> > > If you have any questions, please send me an email to
> > > radoslaw.szwichtenberg@intel.com,=C2=A0=C2=A0adding on CC the X.org b=
oard
> > > (board
> > > at foundation.x.org).
> > > =C2=A0
> > > And don't forget, you can follow us on Twitter for all the latest
> > > updates and to stay connected:
> > > =C2=A0
> > > =C2=A0
> > > https://twitter.com/XOrgDevConf
> > > =C2=A0
> > > Best,
> > > =C2=A0
> > > Radek
> > > =C2=A0
> > > P.S: a DNS redirection (xdc2021.x.org) is work in progress.
> > > Please
> > > use
> > > the mentioned links for the moment.
> > > =C2=A0
> > > =C2=A0
> > > Rados=C5=82aw Szwichtenberg
> > > -------------------------------------------------
> > > Intel Technology Poland sp. z o.o.
> > > ul. Slowackiego 173, 80-298 Gdansk
> > > KRS 101882 - NIP 957-07-52-316
> > > =C2=A0
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


--=-JSpHCLgKrKlySHImBZYz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAmDkCF8ACgkQf/S6MvF9
w0MgvxAAlEPkYv+zzi6cQAVrRhBdZUpeDJQN+F/f7r+GCGiRDElf/9ZG5BB35H0n
2LlA6nUsCsu7QJu4AC9N3y8zTAgHfiO+LxsUuFH/XOTf4C9YIbak5XJVkURR4TRA
+6dfGkKGJSTTpBTWoqK0nxwVOMtvL6m/eQmyAMzMhhxw2/dztLlY94lm9vQQ8KJD
Y4rXppj1kT70NjQU0rRcbj2XcvyLSiAAzZqQrZeyqfuTXhhfU8DlhpyWTHONwSr3
i5IFr7ws1AKFWajm2X3vt6OF/3mz7GBPLckHPozASXUIbttoFLRDmvM+pD+IrlIE
VekLDnvABmTcYX+Wf6Fm9mtJPnjZAJaMi26QMh5Bq2Iz3xIumYPdg/R+3TshABkD
LmSSlEwy1gOqIvgJzfVCtTASWNWRROGO5nUr1yO+o26p1UJ4cR71MXuIuj5SIs9H
mCIFrQhj/lFUuORqPY6WRlFDnigmxBswKowhVv6GO+pKhxaLclK9ps4EC1EKvwLY
/R8fE0CEZpIH5aC6NG5dC5T8pRzmatwC40P2IBZEMbYH1IGCS7muG4ZAthdCcJNt
A/MpfDYfCJFkrpBQ2teeKKwYdd/Rq+q3l41/In97mf2wyTZkhCXgdIdLJtSQooxB
DRV1Huf5e2JeTLvZ5Vnpmpt6SbUP2kWPA/lT55h1m3VOTf1ZZDk=
=2V8p
-----END PGP SIGNATURE-----

--=-JSpHCLgKrKlySHImBZYz--

