Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3334E50E4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A7610E693;
	Wed, 23 Mar 2022 11:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEE310E477;
 Mon, 21 Mar 2022 19:11:18 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D983FD2252;
 Mon, 21 Mar 2022 19:09:38 +0000 (UTC)
Received: (Authenticated sender: didi.debian@cknow.org)
 by mail.gandi.net (Postfix) with ESMTPSA id 78855200004;
 Mon, 21 Mar 2022 19:09:29 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Eric Valette <eric.valette@free.fr>,
 Salvatore Bonaccorso <carnil@debian.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Sasha Levin <sashal@kernel.org>
Subject: Re: Bug#1005005: Regression from 3c196f056666 ("drm/amdgpu: always
 reset the asic in suspend (v2)") on suspend?
Date: Mon, 21 Mar 2022 20:09:19 +0100
Message-ID: <4421935.LvFx2qVVIh@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <3873010.MHq7AAxBmi@ylum>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <164405721350.15142.10930772309423612672.reportbug@ylum.maison>
 <3873010.MHq7AAxBmi@ylum>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2269141.ElGaqSPkdT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 1005005@bugs.debian.org,
 Evan Quan <evan.quan@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dod@debian.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart2269141.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Eric Valette <eric.valette@free.fr>, Salvatore Bonaccorso <carnil@debian.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Sasha Levin <sashal@kernel.org>
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Luben Tuikov <luben.tuikov@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 1005005@bugs.debian.org, Evan Quan <evan.quan@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher <alexdeucher@gmail.com>, dod@debian.org
Subject: Re: Bug#1005005: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic in suspend (v2)") on suspend?
Date: Mon, 21 Mar 2022 20:09:19 +0100
Message-ID: <4421935.LvFx2qVVIh@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <3873010.MHq7AAxBmi@ylum>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan> <164405721350.15142.10930772309423612672.reportbug@ylum.maison> <3873010.MHq7AAxBmi@ylum>

On maandag 21 maart 2022 19:49:56 CET Dominique Dumont wrote:
> On Monday, 21 March 2022 09:57:59 CET Thorsten Leemhuis wrote:
> > Dominique/Salvatore/Eric, what's the status of this regression?
> > According to the debian bug tracker the problem is solved with 5.16 and
> > 5.17, but was 5.15 ever fixed?
> 
> I don't think so.
> 
> On kernel side, the commit fixing this issue is
> e55a3aea418269266d84f426b3bd70794d3389c8 .
> 
> According to the logs of [1] , this commit landed in v5.17-rc3

It was included in 5.15.22, but the newest 5.15 kernel uploaded to Debian was 
5.15.15, so their is no fixed 5.15 in Debian.
It was also included in 5.16.8 and the earlier version in Debian which had 
that commit was 5.16.10 (uploaded 2022-02-18 to Unstable). Current version in 
Unstable is 5.16.14. Testing/Bookworm now had 5.16.12.
In Experimental, on 2022-02-12, 5.17-rc3 was uploaded.

HTH,
  Diederik
--nextPart2269141.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCYjjNXwAKCRDXblvOeH7b
bmG4APwKJH+NoQnMbqymwjfra7bWQF9in5WYMwgRu3GlvTiYhgD9FLab2MAFTrVL
ufgQ54YsqRhBZcrwAhR1mtZBNyRlLw0=
=SPqa
-----END PGP SIGNATURE-----

--nextPart2269141.ElGaqSPkdT--



