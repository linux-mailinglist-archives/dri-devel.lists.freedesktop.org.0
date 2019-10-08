Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED6D080E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F6D6E915;
	Wed,  9 Oct 2019 07:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C709B888AE;
 Tue,  8 Oct 2019 15:50:24 +0000 (UTC)
Received: from [85.152.157.71] (helo=fourier)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iHrP4-000653-JQ; Tue, 08 Oct 2019 17:27:58 +0200
Message-ID: <578af7ed8a3ef8b91a362872471b29702c975529.camel@igalia.com>
Subject: XDC 2019 feedback and comments
From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>
To: Xorg Members List <members@x.org>, "X.Org development"
 <xorg-devel@lists.x.org>, Mesa Dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, events@lists.x.org
Date: Tue, 08 Oct 2019 17:27:48 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; s=20170329; 
 h=MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
 bh=+u7F1Q3l93qPf7h1l8BKOwq340ytjAQNeTC0n1zGT90=; 
 b=Qi1ZJ7Z6E/dbHkKdseA386syZi3oszHvDkIWLbYZf6yygzqtRcnBBrj8kbFlGlf7KroQk79n8KBQFTr2wHnRZYzRDt7HtF3VajKBceKP67xfjlg+qJYJTYuOnr/PJmzLqqDSOtQ+PykRYTXUtdty2SLSStqEoIgXDT/nLJVrD7ev51mG52S+QuUb1NA74TFvYGVcNxZV2lo+/+NyLSSFDjG+0sppjbNTHAVqakSetL+tpqtcYXZeAFQPC33ZuoaJFAoeT8IlH4q/Eo/O0N7oCypPL1BlVA2X3dq/AeLBpPKFNKRsm4abJg9ybRWZofgIYkf6GOnGva7WbjTj/w4LSw==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1542968098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1542968098==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9ZuswaHieEiRF8DEcjRG"


--=-9ZuswaHieEiRF8DEcjRG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Once more huge thanks to the entire team from Collabora,
for their great work organizing XDC 2019!

As usual we're looking for feedback on both XDC itself, and the CFP
process and program selection. Both about what was great and should be
kept for next year's edition, and where there's room for improvement.
The board does keep some notes, for those interested in what we have
already:

- XDC notes for prospective organizers:=20
https://www.x.org/wiki/Events/RFP/

- CFP notes: https://www.x.org/wiki/Events/PapersCommittee/

If you want to send in your comments in private, please send them to
the x.org board.

Cheers,

Sam

--=-9ZuswaHieEiRF8DEcjRG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAl2cqvQACgkQf/S6MvF9
w0O6zQ//Xn114JTHGNnoOotiSy65IEHS4m6JGX6Y5YgCX7gQOGYZc4L7HUPfXMe5
TZVnzOQJRO0DjWFwYUiS90ku5BtP+0InxQsnBlAZti3dVJkhJtbK/34rODtN8UGQ
zcuJHMZKUHuVAGtH2/RdxKHTleWqk4GjL2tJx/+pvEkZiq9uDNFf7M0/uUh5nmuh
hoHh0HXahaFic7paYuZp4xgmwiaC8x23VdGU9NRoMTAlq5gigr/XuoJxllUQSTn9
6uJBza0U4rMNN5/OloRJiVIaCoE4QYd9eBvdT0l6PEJoxQMvY8+k70LAfLJQlWAQ
KiEF6lW8S/a5cs7YbQ3BEzTi3/i6vE72kmZ1j3/PSn4jIVUWkHDK8VSEAYe2aPr0
ShjEficFGk7jaeNnvA+wRSQPO2eu0ch2FXybcp46iJ0PBtiBssjoIfuSlFw5DE8i
vOq1obBJwiSRss6jogxAzqd4pFb1pqWnCqUBD99n/fKuOVo9D5laX6rpZ/bRw9ME
mXfXF3KnDUiX5ZlEnm6BgUYgRXAwe0onNV5c/aBtKKwppbRccl0rvbFFfdlw2m1I
FDuR1Ar/dixtwk9j6QTLlsL/Nz7qwOwIn3lHLGWxlo3fKn5q0KfpV3hKQWl2mvgl
jALd1nWILCWpw+ehPxQbDEmMW27xfT1rS9ZhadrT11wZk3OliPs=
=YNft
-----END PGP SIGNATURE-----

--=-9ZuswaHieEiRF8DEcjRG--


--===============1542968098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1542968098==--

