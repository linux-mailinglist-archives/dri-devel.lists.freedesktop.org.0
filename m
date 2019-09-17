Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89417B50FF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 17:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6687A6ECD5;
	Tue, 17 Sep 2019 15:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2F66ECD5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 15:06:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id F1749263971
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ioctl: Add a ioctl to label GEM objects
Date: Tue, 17 Sep 2019 17:06:51 +0200
Message-ID: <7417089.R7MlzD2he6@solembum>
Organization: Collabora Ltd.
In-Reply-To: <20190916122040.34djeqqnbegcwifp@intel.com>
References: <20190916103541.29015-1-rohan.garg@collabora.com>
 <20190916122040.34djeqqnbegcwifp@intel.com>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0894280985=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0894280985==
Content-Type: multipart/signed; boundary="nextPart5317179.HbgjfBoW9J"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5317179.HbgjfBoW9J
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi

> Might be worth mentioning in the comment here that `len` includes the
> trailing NULL.
> 

Ack, I'll address this in v2.

Cheers
Rohan Garg
--nextPart5317179.HbgjfBoW9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl2A9osACgkQpwS9TvJn
IJTf6xAAmF/L7bg4ffoJPoLJuNq+rpXblujugsJPTNlxxn+AG+YIdvy2FUu/19YQ
qV+ce043kmKDuu5+IWdl7Gegnv5b/c/dv0RM5nL6IUzZRf1QF15YMxRhS7h7Wsib
h94DqHxYk/3346FRx4snN3PujqzwLmUYRVFgFB2wkWAHeeSlz/nPpNqHIc/sdjnQ
rj/OpsGHp3ppOQAUm1NoY5SJZbRIwtlnBsnbq2hV7HIfcEytyZRLiTC+V+j4wXeT
r3B+MtsHpzc0D/emkIbHEpN7+5p5KYpTGwFECC8+dTIzNAvCvR9O7IhqshGEyrqE
nAImJJUsb5F7gPb9tbQvYj/YgHRfoQgKzKXdgzl7KxOX7IzwhCaU6xZR0fIaWsPv
QoPxViHv4RqlxfN2RNA1HlFHfLRQdpqrPC8D74MiasiMU7UFl0zwUsYtOK0jnj7j
TF3jGdME8oHKb58vNQxpShqKsTYJRAUK6QbVAM2eZMnmCpwTu6U5LADzXIXrVGlM
bLAiduejLvhro9iNwfvDRrad6G/CnaVi8usd13eYTWWBzO64tZlj+7vU9G/GVfYZ
x6am4ilnoVpbsL+g5Qa3ZVnuTWO8rfwlozRDtRnzj7uZPa8KZVI2SNRhvpFW0WlE
gzToy/u2ZfXy18ZzvgC0VSdJx4qbGgBmEGJgRLVdgYI3Qnz/K/U=
=VDLr
-----END PGP SIGNATURE-----

--nextPart5317179.HbgjfBoW9J--




--===============0894280985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0894280985==--



