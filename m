Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7A3B9491
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683E26EB50;
	Thu,  1 Jul 2021 16:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0E6E0CB;
 Thu,  1 Jul 2021 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=wK9wrmd+6oYN7FKRJ1PwqG4FPKNWD7UZGqxDhFVY3YA=; 
 b=Y4rlul+uhkYkZ4p6PoktJ1He64NFdmYZWcPpM13vr6JwyByUFcMFxf7tyOvHSUYGAsQGuCwcUoD7h5DI4G0VjAPU8O8+bLIPf62+t7OUSN+R/QYhU0JnC0VuJKQTtRvbWX3fbx6b5WzNX1bZImGRveVbDTtd/0HPNao87E/LJkrpM6iDlUx/srHN6OI5snwK8PxazjWK5xG7t3iJJ9WU+csZyt0hFOSwx3R6pP4/3oRO0mRpynHUbJfXQ4UfRyQqzglMs6SBk6RjTXKmiyJ0CAnUvAeJ2bnyP0rx715hkwTsNSF1wpGP3s6PM34qHol9in6d5fNW/mzzdtcje0K6/g==;
Received: from 152.red-88-9-105.dynamicip.rima-tde.net ([88.9.105.152]
 helo=[192.168.2.252]) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lyzKj-0005WT-LU; Thu, 01 Jul 2021 18:14:33 +0200
Message-ID: <f5ee80e067e79dff0b2d65c67dbb83b9be70014f.camel@igalia.com>
Subject: Re: [Mesa-dev] Requests For Proposals for hosting XDC 2022 are now
 open
From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>
To: "events@lists.x.org" <events@lists.x.org>, 
 "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, wayland-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Date: Thu, 01 Jul 2021 18:14:23 +0200
In-Reply-To: <95ec2c414f7dd1ea5685184435b95430e1709047.camel@igalia.com>
References: <95ec2c414f7dd1ea5685184435b95430e1709047.camel@igalia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-QH/ByUmgrN7MqV73jY6n"
User-Agent: Evolution 3.38.3-1 
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


--=-QH/ByUmgrN7MqV73jY6n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a reminder that the call for proposals for hosting XDC 2022
period finishes in two months.

Be sure to prepare your submission before you leave on holiday!

Sam

On Thu, 2021-05-20 at 12:15 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> Hello everyone!
>=20
> The X.org board is soliciting proposals to host XDC in 2022. Since
> XDC 2021 is being held in Europe this year (although virtually),
> we've
> decided to host in North America. However, the board is open to other
> locations, especially if there's an interesting co-location with
> another conference.
>=20
> Of course though, due to the ongoing COVID-19 pandemic it's not yet
> clear whether or not it will be possible to host XDC 2022 in person,
> although is seems very likely. Because of this, we would like to
> make it clear that sponsors should prepare for both the possibility
> of an in person conference, and the possibility of a virtual
> conference. We will work with organizers on coming up with a
> deadline for deciding whether or not we'll be going virtual, likely
> sometime around July 2022.
>=20
> If you're considering hosting XDC, we've assembled a wiki page with
> what's generally expected and needed:
>=20
> https://www.x.org/wiki/Events/RFP/
>=20
> When submitting your proposal, please make sure to include at least
> the
> key information about the potential location in question, possible
> dates along with estimated costs. Proposals can be submitted to board
> at foundation.x.org until the deadline of *September 1st, 2021*.=C2=A0
>=20
> Additionally, an quirk early heads-up to the board if you're
> considering hosting would be appreciated, in case we need to adjust
> the
> schedule a bit. Also, earlier is better since there generally will be
> a
> bit of Q&A with organizers.
>=20
> And if you just have some questions about what organizing XDC
> entails,
> please feel free to chat with previous organizers, or someone from
> the
> board.
>=20
> Thanks,
>=20
> Sam
>=20
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev


--=-QH/ByUmgrN7MqV73jY6n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAmDd6d8ACgkQf/S6MvF9
w0MKsRAA13BGnKOl2o6oyp+Ws0lBHITyQt5yGc5pIHoT3xjPVY924AFiGtJTsGq/
oqYp9tMAGduh5VbFDmg9/FanKRpFSbFI8xXTWMuwC6OgaXgu+c9NDO8ilN8wl9vP
3sAv88KlFP2bJtwwruGjw+jro7tnXE4WvKLaBILW8cqt3nL2xNZbI2JknPIFQDgp
sddQ0GKSvFCtYuiEaMfxVTasJcaIyf1F4+bew031wDkS4yiuLdXUrBEoEXWNuGWG
tcMg3HzGBAIkMFXrk3J8aSpSFlj/1r/AXlmT+UMHzp19xCk9YHcgEN5rUlnHA2BI
AFrJKl5UBXiEl4q8h3V8sUoDM+MBItgpZxxW1P80dJvJe/OT0K9gh4VkYQoQx9Xh
mg9IzmKENsavip/0Osh91MC9hUIBjEAvGWt2evEjlaIRCd2/xb1KO+gXcCMlz884
nfZOoi3vAxtG/+XAohOq1pmdE6iSyuLdq8SPxtLSFXGCScHQ0R1Mh1I3xxou4dp6
8jF2Wl4unF2ovuzCsR6VjQDyyGkXKCJHlueFLYyRrmlqjHd9n6ZDeQvHgCnYW93X
eYYplicS4TVcZ9GHTsTgmxgGLXSM+aR7xzOZ0NQ4Dcy06uSYdbMet1iLz3XA3MoO
ADwUOZ7evzwvmkdZ0AN4TjPI0iVtf9aVeZ5hpGPkP/eBEF033gA=
=6VGv
-----END PGP SIGNATURE-----

--=-QH/ByUmgrN7MqV73jY6n--

