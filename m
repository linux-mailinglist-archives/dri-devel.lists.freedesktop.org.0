Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B73A26D99
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFF910E5C8;
	Tue,  4 Feb 2025 08:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D4D10E56F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:01:04 +0000 (UTC)
Received: from [192.168.0.73] (unknown [89.134.11.164])
 by c64.rulez.org (Postfix) with ESMTPSA id 600B7100F6;
 Mon,  3 Feb 2025 22:01:02 +0100 (CET)
Message-ID: <cde718b7-332f-676f-4568-bb4b0b045957@c64.rulez.org>
Date: Mon, 3 Feb 2025 22:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-GB
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <f921492d-6c53-ce68-16b6-dc9c21f2b738@c64.rulez.org>
 <ba5b7b47-1082-4949-8bf2-9bc5239af35b@gmx.de>
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
Subject: Re: [RFC PATCH 00/12] Deduplicate cfb/sys drawing fbops
In-Reply-To: <ba5b7b47-1082-4949-8bf2-9bc5239af35b@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------15YTt1LrFqiF8SFYmkSGFLY0"
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------15YTt1LrFqiF8SFYmkSGFLY0
Content-Type: multipart/mixed; boundary="------------UN0SGzCkdtDhS4vuqZ1q0YKr";
 protected-headers="v1"
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <cde718b7-332f-676f-4568-bb4b0b045957@c64.rulez.org>
Subject: Re: [RFC PATCH 00/12] Deduplicate cfb/sys drawing fbops
References: <f921492d-6c53-ce68-16b6-dc9c21f2b738@c64.rulez.org>
 <ba5b7b47-1082-4949-8bf2-9bc5239af35b@gmx.de>
In-Reply-To: <ba5b7b47-1082-4949-8bf2-9bc5239af35b@gmx.de>

--------------UN0SGzCkdtDhS4vuqZ1q0YKr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


> Some notes regarding your patches:
> - please add dri-devel@lists.freedesktop.org mailing list

Will do next time.

> - it seems you sent your patches manually.

Yes, I thought it will work after a bit of practice without mistakes. Sor=
ry.

> - patch #2 is missing, and patches 1-5 have the same subject.

On that one I missed to delete the "Re:" prefix in the subject, but it
was there. And after the 5th I noticed that possibly the subject needs to=

be changed as well. Also replies should have been on the first one not
always on the previous one.

> - When applying there are warnings:

Will retab and white space clean it next time. However I noticed that eve=
n
if I set up the e-mail client as advised it still removed single spaces i=
n
diffs for unchanged empty lines.

> I suggest you make yourself familiar with "git-publish" (https://github=
=2Ecom/stefanha/git-publish).
> It's a great tool which helps a lot for sending patches.

That complicates things but it seems it's almost impossible to do it corr=
ectly
manually. Will look into it.

--------------UN0SGzCkdtDhS4vuqZ1q0YKr--

--------------15YTt1LrFqiF8SFYmkSGFLY0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE8WlaH4v4aHNT2Bn0WOeEu4KftGsFAmehLo0FAwAAAAAACgkQWOeEu4KftGt7
qgf+IyRdvu6aIpqcUk3Ah16PDUF034LpJML7YLSjnDulChtSvVibyK8fSZJCpEo4I2WDQpFrPmCh
YweATCJZ3Mc6zea/sjGgZFppMHscYtDcZl88YaOHqJfSaRf5802ZieHTOqbI+9G6C1YT0y+c9ZTn
wY2U5T8yyv871kw2BqeC4gDoA6LorldExcLkQvFFxrVsQ0sMZ0lyPMnIrn7vWFBUjk+BbHdj+gFZ
3UUMuJ0ms5teKxw3DRVXBdU3IwsWyIjGwTmHvrG97BklzHpyl6MGT3CrjIAKlIgQb5xnMt1g2rEl
dIhz9FR89c81ugVE8e5K43x7ksygjWNeLDNKR+ksNQ==
=jUEc
-----END PGP SIGNATURE-----

--------------15YTt1LrFqiF8SFYmkSGFLY0--
