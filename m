Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB1395061
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 12:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF086E133;
	Sun, 30 May 2021 10:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E36E1F7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622299105;
 bh=sqFFYd/KnOdiQOREFAoCNGmMndcNw33J7hm7p+gmCY0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XgVvBQ+5P27xJuoEig000Dnz/UuKRvFd5/kMRuWTn0H1Ir0TR4cenQYwx0Gz9KeA/
 FxUipwadcwmLvs3e7CcKOapFAGweOvJv3N3O/C6Epxjjt0dLwEKnd+drucGpRbBZb3
 U6mhLm+Lz0Ac7omwFMAcb0Pd4/qdA7y9MIT7i0ic=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1m3hU40Gbd-00PdgD; Sat, 29
 May 2021 16:38:25 +0200
Date: Sat, 29 May 2021 16:38:24 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 2/2] maintainers: Update freedesktop.org IRC channels
Message-ID: <YLJR4EzDtbKQuq1K@latitude>
References: <20210529141638.5921-1-alyssa@rosenzweig.io>
 <20210529141638.5921-2-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EgF5M27ocdrjiQgO"
Content-Disposition: inline
In-Reply-To: <20210529141638.5921-2-alyssa@rosenzweig.io>
X-Provags-ID: V03:K1:x0DoD91BHTpftfVxqZ01pXYesqZMQ22iNMBIGcBkfR2MoHj05y1
 y1n9xdjiK1Ut0KWpOZvIqMp9el4QgMxI6aRCxXDZcrUqMLuBFy5LQTVCxfYRD9A3HKjjCeV
 AK8mYDAkVu3PENR3TVew1abpSZZ/gkDtKejumwyYogVSFGsqZ8AezwX2K2p9MSQI/AEcuEa
 SlwgHi5mOguBX5zxGs0Hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EKregGY02JU=:QqE1i60gtMybW+49opieos
 LxNABb0UdFXAE0OuHQKY1d7/XVsWPkDQJD/YTwW93ybq3ISGnZfRRRQa4wKJL/ZXFYlmtfPeQ
 vq6dUrXz9hSyUmIEDZk6ewM5MefZKR/sqTu1RbG6rDjHkdQziF1Iw1dh4//bTJ4A8AMRNwr8k
 s9IGKPovU3fp+gQ6ppD1jFhHt7z3ug+5kHjF4Ln1UioHKAY8nqK7X3MVKwiXxcHaEs4mJ9lnX
 +xUzHimrLBiFqHctDNIPbG5TCfmuOT5jSk0pXb3vqyskq5BmxVL2pKOieHXzKQL7QxzlXHnjy
 HeZRHlYz3ZTQ1tpMv/jWlyCdMAHD4ax9PvRU6gfvJSa/KRXy8rlAbc5Bg8Qv1pbTU0mQzRq1i
 6BAcEtwreTT4UvDrgqDt019Yy2tppKENZvneYbGsgMey19QxhbM0kJ9Don5Ysz+jnmbnfyZ+I
 DjrMTciuOoMP89qcHk7ZZk5KxOZXZNi/QTVjr68QYckTVOEq9cz7ICmrmko9MtrnwY6KpaTI2
 8ZYlmF8YZG8bRq/QBcmliCdXOFzxE9r4d+1Hl7itMZX51x761yX3PCyGmmLT9gn2yGcZDX0c6
 gJYU3P6sgTk4ykgxnxHWElL7ZaonIzbC7wXsSIuLpA1rUr2ipa+SQ4dOU1T9mmgV0ug6sQSdA
 /qoDeqJL3N0NQCwgIC2HLOMN/wg67/O1Tvh4SMwXTygPuvXvUaANR2YssZv0GLMvoblzA87di
 zvINE213CfLSVXehf+IfopnJWrkXOq+QGFY38sQQvCFMhFcWzg7oOcZHXckcUzTN6IFdJ7sQT
 JUgoWBQqKadB/i8nLOiX6bElQPLemMn78E6JFwsijvVz73qwdkBhpizgP7cXoYfc0XikpAFDq
 tqDO0H0nsqnYyhu71y+xKcMc4c8oZJ+hYQwSQkkNmfY4k1O+qTVGBTYgiaDN2SNMFLRoFjleL
 Dk1G+kZWfNZdaPdfK24yAIFTl/43VSNRctXTwjB2Jn3VRZowX5bTIgkkyIHTqHRn8m78zOKZk
 8Z53YllqSpRDd6Y1SBsstC1YqxAdBUZkSERbDM34D9Bi4O+7Vo5OfimCWM9/fW6OYpNyb5syx
 AbYJ7xInShRhXBQvpLBtFouK/BirQUdwf6PuDZHwbx7adOEyuPIhku9LQ==
X-Mailman-Approved-At: Sun, 30 May 2021 10:07:36 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EgF5M27ocdrjiQgO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 29, 2021 at 10:16:38AM -0400, Alyssa Rosenzweig wrote:
> Like many free software projects, freedesktop.org issued a non-binding
> recommendation for projects to migrate from OFTC to Freenode [1]. As

The other way around:                    from Freenode to OFTC

> such, freedesktop.org entries in the MAINTAINERS file are out-of-date as
> the respective channels have moved. Update the file to point to the
> right network.
>=20
> [1] https://lists.freedesktop.org/archives/dri-devel/2021-May/307605.html


Thanks,
Jonathan Neusch=C3=A4fer

--EgF5M27ocdrjiQgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmCyUdkACgkQCDBEmo7z
X9sA0g/+MQbMYs+3+ELxmSdundO0rlkL/aIV22p1jI849DDDvCjyX/J6dRHp7ApW
DDFS8YUig7liyIzqMlCw8lsyTB56OnoqcvC/EQNjmneJ15551UV0OOrHhysx7d1E
J7xV0Z3na7ZnhxlhovQf6ApQxVdLtJ5OxY9Msw+ulvxhUX+6FQWUTxdeW9N+hjlH
iZbjkmT/Ug3wiIohjE1lE0GN8KmNV+8A157xLSAtu5FfvCY5jb9QpDGEWxEGVi/n
TUbNXNMiE3A3KzDljLtkJ2LGWHvqujE+TZao2XmTvcQIYJVHUsFMfWtIa3WXL98t
/mBmHNt6FOslPuYLVt+sHtnv7XLFGEJI7w3m42PborEiN8BFJjlwvg/Lff0K48Sl
iKIaTfjEgEjg46dYc6+4p5DaOXdhqvLq7F2gMLOAA5svN3xFvO9mn/+/hK4M6SEM
2tXBg7OxMGDn321l5VV11zjqSGk9gM90uQr9XYKALyL6nx/yBG0INkpg0lDP3edf
bWM5qiacghylnDzYu/M4KP/PeZ01aOE7kAyFeRDOTGzP7X2mf8nCZFlwl2FeEvy9
TRs7uSOwazno4+AW7atYWJCZu0B0yVhINEfWf6vkkpoXlXWT9np6GFOfgZG+Riet
za/3dbtl1yXmfIgUk1quHDq+To9p9nWp2Bkj/7jRqL0SG1eTpI8=
=71ua
-----END PGP SIGNATURE-----

--EgF5M27ocdrjiQgO--
